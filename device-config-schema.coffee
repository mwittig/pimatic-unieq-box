module.exports = {
  title: "pimatic-unieq-box device config schema"
  UnieqBox: {
    title: "UNIEQ Box"
    name: "UNIEQ Box Smart Meter"
    type: "object"
    extensions: ["xLink", "xAttributeOptions"]
    properties:
      attributes:
        type: "array"
        default: [
          {
            "register": "1-0:1.4.0*255",
            "unit": "W",
            "name": "Active power+"
          },
          {
            "register": "1-0:2.4.0*255",
            "unit": "Wh",
            "name": "Active energy+"
          },
          {
            "register": "1-0:2.4.0*255",
            "unit": "W",
            "name": "Active power-"
          },
          {
            "register": "1-0:2.8.0*255",
            "unit": "Wh",
            "name": "Active energy-"
          },
          {
            "register": "1-0:3.4.0*255",
            "unit": "var",
            "name": "Reactive power+"
          },
          {
            "register": "1-0:3.8.0*255",
            "unit": "varh",
            "name": "Reactive energy+"
          },
          {
            "register": "1-0:4.4.0*255",
            "unit": "var",
            "name": "Reactive power-"
          },
          {
            "register": "1-0:4.8.0*255",
            "unit": "varh",
            "name": "Reactive energy-"
          },
          {
            "register": "1-0:9.4.0*255",
            "unit": "VA",
            "name": "Apparent power+"
          },
          {
            "register": "1-0:9.8.0*255",
            "unit": "vah",
            "name": "Apparent energy+"
          },
          {
            "register": "1-0:10.4.0*255",
            "unit": "VA",
            "name": "Apparent power-"
          },
          {
            "register": "1-0:10.8.0*255",
            "unit": "vah",
            "name": "Apparent energy-"
          },
          {
            "register": "1-0:13.4.0*255",
            "name": "Power factor"
          },
          {
            "register": "1-0:14.4.0*255",
            "unit": "Hz",
            "name": "Supply frequency"
          },
          {
            "register": "1-0:21.4.0*255",
            "unit": "W",
            "name": "Active power+ (L1)"
          },
          {
            "register": "1-0:21.8.0*255",
            "unit": "Wh",
            "name": "Active energy+ (L1)"
          },
          {
            "register": "1-0:22.4.0*255",
            "unit": "W",
            "name": "Active power- (L1)"
          },
          {
            "register": "1-0:22.8.0*255",
            "unit": "Wh",
            "name": "Active energy- (L1)"
          },
          {
            "register": "1-0:23.4.0*255",
            "unit": "var",
            "name": "Reactive power+ (L1)"
          },
          {
            "register": "1-0:23.8.0*255",
            "unit": "varh",
            "name": "Reactive energy+ (L1)"
          },
          {
            "register": "1-0:24.4.0*255",
            "unit": "var",
            "name": "Reactive power- (L1)"
          },
          {
            "register": "1-0:24.8.0*255",
            "unit": "varh",
            "name": "Reactive energy- (L1)"
          },
          {
            "register": "1-0:29.4.0*255",
            "unit": "VA",
            "name": "Apparent power+ (L1)"
          },
          {
            "register": "1-0:29.8.0*255",
            "unit": "vah",
            "name": "Apparent energy+ (L1)"
          },
          {
            "register": "1-0:30.4.0*255",
            "unit": "VA",
            "name": "Apparent power- (L1)"
          },
          {
            "register": "1-0:30.8.0*255",
            "unit": "vah",
            "name": "Apparent energy- (L1)"
          },
          {
            "register": "1-0:31.4.0*255",
            "unit": "A",
            "name": "Current (L1)"
          },
          {
            "register": "1-0:32.4.0*255",
            "unit": "V",
            "name": "Voltage (L1)"
          },
          {
            "register": "1-0:33.4.0*255",
            "name": "Power factor (L1)"
          },
          {
            "register": "1-0:41.4.0*255",
            "unit": "W",
            "name": "Active power+ (L2)"
          },
          {
            "register": "1-0:41.8.0*255",
            "unit": "Wh",
            "name": "Active energy+ (L2)"
          },
          {
            "register": "1-0:42.4.0*255",
            "unit": "W",
            "name": "Active power- (L2)"
          },
          {
            "register": "1-0:42.8.0*255",
            "unit": "Wh",
            "name": "Active energy- (L2)"
          },
          {
            "register": "1-0:43.4.0*255",
            "unit": "var",
            "name": "Reactive power+ (L2)"
          },
          {
            "register": "1-0:43.8.0*255",
            "unit": "varh",
            "name": "ReActive energy+ (L2)"
          },
          {
            "register": "1-0:44.4.0*255",
            "unit": "var",
            "name": "Reactive power- (L2)"
          },
          {
            "register": "1-0:44.8.0*255",
            "unit": "varh",
            "name": "ReActive energy- (L2)"
          },
          {
            "register": "1-0:49.4.0*255",
            "unit": "VA",
            "name": "Apparent power+ (L2)"
          },
          {
            "register": "1-0:49.8.0*255",
            "unit": "vah",
            "name": "Apparent energy+ (L2)"
          },
          {
            "register": "1-0:50.4.0*255",
            "unit": "VA",
            "name": "Apparent power- (L2)"
          },
          {
            "register": "1-0:50.8.0*255",
            "unit": "vah",
            "name": "Apparent energy- (L2)"
          },
          {
            "register": "1-0:51.4.0*255",
            "unit": "A",
            "name": "Current (L2)"
          },
          {
            "register": "1-0:52.4.0*255",
            "unit": "V",
            "name": "Voltage (L2)"
          },
          {
            "register": "1-0:53.4.0*255",
            "name": "Power factor (L2)"
          },
          {
            "register": "1-0:61.4.0*255",
            "unit": "W",
            "name": "Active power+ (L3)"
          },
          {
            "register": "1-0:61.8.0*255",
            "unit": "Wh",
            "name": "Active energy+ (L3)"
          },
          {
            "register": "1-0:62.4.0*255",
            "unit": "W",
            "name": "Active power- (L3)"
          },
          {
            "register": "1-0:62.8.0*255",
            "unit": "Wh",
            "name": "Active energy- (L3)"
          },
          {
            "register": "1-0:63.4.0*255",
            "unit": "var",
            "name": "Reactive power+ (L3)"
          },
          {
            "register": "1-0:63.8.0*255",
            "unit": "varh",
            "name": "Reactive energy+ (L3)"
          },
          {
            "register": "1-0:64.4.0*255",
            "unit": "var",
            "name": "Reactive power- (L3)"
          },
          {
            "register": "1-0:64.8.0*255",
            "unit": "varh",
            "name": "Reactive energy- (L3)"
          },
          {
            "register": "1-0:69.4.0*255",
            "unit": "VA",
            "name": "Apparent power+ (L3)"
          },
          {
            "register": "1-0:69.8.0*255",
            "unit": "vah",
            "name": "Apparent energy+ (L3)"
          },
          {
            "register": "1-0:70.4.0*255",
            "unit": "VA",
            "name": "Apparent power- (L3)"
          },
          {
            "register": "1-0:70.8.0*255",
            "unit": "vah",
            "name": "Apparent energy- (L3)"
          },
          {
            "register": "1-0:71.4.0*255",
            "unit": "A",
            "name": "Current (L3)"
          },
          {
            "register": "1-0:72.4.0*255",
            "unit": "V",
            "name": "Voltage (L3)"
          },
          {
            "register": "1-0:73.4.0*255",
            "name": "Power factor (L3)"
          }
        ]
        format: "table"
        items:
          type: "object"
          properties:
            name:
              description: "The name of metered entity"
              type: "string"
            register:
              description: "The OBIS register code"
              type: "string"
            unit:
              description: "The measurement unit"
              type: "string"
      interval:
        description: "The time interval in minutes (minimum 30) at which the report will be queried"
        type: "number"
        default: 30
        minimum: 30
  }
}