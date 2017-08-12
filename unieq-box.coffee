# #UnieqBox plugin

module.exports = (env) ->

  Promise = env.require 'bluebird'
  rest = require('restler-promise')(Promise)
  _ = env.require 'lodash'
  util = require 'util'
  events = require 'events'

  commons = require('pimatic-plugin-commons')(env)

  class UnieqBoxPlugin extends env.plugins.Plugin

    init: (app, @framework, @config) =>
      # register devices
      deviceConfigDef = require("./device-config-schema")
      @debug = @config.debug || false
      @base = commons.base @, "UnieqBoxPlugin"

      @framework.deviceManager.registerDeviceClass("UnieqBox", {
        configDef: deviceConfigDef.UnieqBox,
        createCallback: (config, lastState) =>
          return new UnieqBoxDevice config, @, lastState
      })



  class UnieqBaseDevice extends env.devices.Device
    # Initialize device by reading entity definition from middleware
    constructor: (@config, @plugin, @service) ->
      @debug = @plugin.config.debug ? false
      @base = commons.base @, @config.class unless @base?

      @base.debug("Device Initialization")
      @id = @config.id
      @name = @config.name
      @interval = 1000 * @base.normalize @config.interval, 10, 86400
      @host = @config.host
      @port = @config.port
      super()
      process.nextTick () =>
        @_requestUpdate()

    destroy: () ->
      @base.cancelUpdate()
      super()

    _requestUpdate: (command) ->
      if @host?
        rest.get("http://#{@host}:#{@port}/hook/unieq-json/")
          .then (result) =>
            if result.data?.registers?
              @base.debug "Response: #{util.inspect(result.data, { showHidden: true, depth: 4 })}"
              @emit "data", null, result.data.registers
            else
              throw new Error "Invalid response data"
          .catch (errorResult) =>
            @base.error if errorResult instanceof Error then errorResult else errorResult.error
          .finally () =>
            @base.scheduleUpdate @_requestUpdate, @interval
      else
        @base.error "Invalid configuration. Property host is undefined"

    _has: (obj, path) ->
      return false if not _.isObject obj or not _.isString path
      keys = path.split '.'
      for key in keys
        if not _.isObject(obj) or not obj.hasOwnProperty(key)
          return false
        obj = obj[key]
      return true

  class AttributeContainer extends events.EventEmitter
    constructor: () ->
      @values = {}

  class UnieqBoxDevice extends UnieqBaseDevice
    attributeTemplates =
      activePowerSupply:
        type: "number"
        register: "1-0:1.4.0*255"
        unit: "W"
        description: "Active power+"
        acronym: "P+"
      activeEnergySupply:
        type: "number"
        register: "1-0:1.8.0*255"
        unit: "Wh"
        description: "Active energy+"
        acronym: "E+"
      powerFactor:
        type: "number"
        register: "1-0:13.4.0*255"
        description: "Power factor"
        acronym: "PF"
      supplyFrequency:
        type: "number"
        register: "1-0:14.4.0*255"
        unit: "Hz"
        description: "Supply frequency"
        acronym: "F"

    # Initialize device by reading entity definition from middleware
    constructor: (@config, @plugin, lastState) ->
      @debug = @plugin.config.debug ? false
      @base = commons.base @, @config.class unless @base?
      @attributeValues = new AttributeContainer()
      @attributes = _.cloneDeep(@attributes)
      @obis2name = {}

      for attributeName in @config.attributes
        do (attributeName) =>
          if attributeTemplates.hasOwnProperty attributeName
            properties = attributeTemplates[attributeName]
            @attributes[attributeName] =
              description: properties.description || () ->
                return attributeName.replace /(^[a-z])|([A-Z])/g, ((match, p1, p2, offset) =>
                  (if offset>0 then " " else "") + match.toUpperCase())
              type: properties.type
              unit: properties.unit if properties.unit?
              acronym: properties.acronym if properties.acronym?

            @attributeValues.values[attributeName] = 0
            @obis2name[properties.register] = attributeName

            @attributeValues.on attributeName, ((value) =>
              @base.debug "Received update for", attributeName, value
              if value?
                @attributeValues.values[attributeName] = value
                @emit attributeName, value
            )

            @_createGetter(attributeName, =>
              return Promise.resolve @attributeValues.values[attributeName]
            )
          else
            @base.error "Configuration Error. No such attribute: #{attributeName} - skipping."

      super(@config, @plugin, "GetPowerFlowRealtimeDataData")

      @on 'data', ((error, values) =>
        if error or not values
          if error
            @base.error error
        else
          for item in values
            @base.debug JSON.stringify(item), @obis2name
            if @obis2name.hasOwnProperty item.register
              @base.debug "Matched", @obis2name[item.register]
              @attributeValues.emit @obis2name[item.register], item.value
      )

    destroy: () ->
      super()


  # ###Finally
  # Create a instance of my plugin
  myPlugin = new UnieqBoxPlugin
  # and return it to the framework.
  return myPlugin
