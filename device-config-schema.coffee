module.exports = {
  title: "pimatic-unieq-box device config schema"
  UnieqBox: {
    title: "UNIEQ Box"
    name: "UNIEQ Box Smart Meter"
    type: "object"
    extensions: ["xLink", "xAttributeOptions"]
    properties:
      host:
        description: """
          The hostname or IP address of the energy meter
        """
        type: "string"
      port:
        description: """
          The port for the REST/JSON endpoint of the energy meter providing metering data
        """
        type: "number"
        default: 3777
      attributes:
        type: "array"
        default: [
          "activePowerSupply", "activeEnergySupply",
          "powerFactor", "supplyFrequency"
        ]
        format: "table"
        items:
          enum: [
            "activePowerSupply", "activeEnergySupply",
            "powerFactor", "supplyFrequency"
          ]
      interval:
        description: """
          The time interval in seconds (minimum 10, default 20) at which the report will be queried
        """
        type: "number"
        default: 20
        minimum: 10
  }
}