# DTC Lookup API - Ruby Gem

DTC Lookup explains OBD-II diagnostic trouble codes such as P0301 or U0100. It returns the code's system and standard title, which warning light it turns on, and on paid plans the full description, likely causes ranked by likelihood, symptoms, repair difficulty, estimated cost and labor hours, and related codes. Carmaker-specific codes are covered for 32 makes.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'apiverve_dtclookup'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install apiverve_dtclookup
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```ruby
require 'apiverve_dtclookup'

# Initialize the client
client = APIVerve::Dtclookup::Client.new(api_key: "YOUR_API_KEY")

# Make a request
response = client.execute({
  code: "P0301",
  make: "Ford",
  lang: "en"
})

# Print the response
puts response
```


### Error Handling

```ruby
begin
  response = client.execute({ code: "P0301", make: "Ford", lang: "en" })
  puts response["data"]
rescue APIVerve::Dtclookup::ValidationError => e
  puts "Validation error: #{e.errors.join(', ')}"
rescue APIVerve::Dtclookup::APIError => e
  puts "API error: #{e.message}"
  puts "Status code: #{e.status_code}"
end
```

### Debug Mode

```ruby
# Enable debug logging
client = APIVerve::Dtclookup::Client.new(
  api_key: "YOUR_API_KEY",
  debug: true
)
```

## Example Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "code": "P0301",
    "found": true,
    "system": "Powertrain",
    "subsystem": "Ignition",
    "codeType": "generic",
    "title": "Cylinder 1 Misfire Detected",
    "description": "Misfires concentrated on cylinder 1. A cylinder-specific code points away from shared causes (fuel pressure, MAF) toward components dedicated to that cylinder — coil, spark plug, injector, compression.",
    "warningLight": "Check Engine Light",
    "affectedComponents": [
      "ignition_coil",
      "spark_plug",
      "fuel_injector"
    ],
    "causes": [
      {
        "cause": "Ignition coil for cylinder 1 failed",
        "likelihood": "high"
      },
      {
        "cause": "Spark plug for cylinder 1 worn or fouled",
        "likelihood": "high"
      },
      {
        "cause": "Cylinder 1 injector clogged",
        "likelihood": "medium"
      },
      {
        "cause": "Low compression on cylinder 1",
        "likelihood": "low"
      }
    ],
    "symptoms": [
      "Check engine light on or flashing",
      "Rough idle and uneven running",
      "Power loss, hesitation under acceleration",
      "Increased fuel consumption",
      "Possible smell of unburned fuel from exhaust"
    ],
    "repairDifficulty": "easy",
    "diyPossible": true,
    "estimatedRepairCost": {
      "min": 40,
      "max": 800,
      "currency": "EUR"
    },
    "estimatedLaborHours": {
      "min": 0.3,
      "max": 4
    },
    "emissionsRelated": true,
    "limpModePossible": null,
    "relatedCodes": [
      "P0302",
      "P0303",
      "P0304",
      "P0305",
      "P0306",
      "P0307",
      "P0308",
      "P0309",
      "P0310",
      "P0311",
      "P0312"
    ],
    "make": null,
    "manufacturer": null,
    "availableMakes": null,
    "language": "en"
  }
}
```

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/dtclookup?utm_source=rubygems&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/dtclookup?utm_source=ruby&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/dtclookup?utm_source=ruby&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This gem is available under the [MIT License](LICENSE).
