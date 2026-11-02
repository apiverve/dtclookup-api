# DTC Lookup API - Dart/Flutter Client

DTC Lookup explains OBD-II diagnostic trouble codes such as P0301 or U0100. It returns the code's system and standard title, which warning light it turns on, and on paid plans the full description, likely causes ranked by likelihood, symptoms, repair difficulty, estimated cost and labor hours, and related codes. Carmaker-specific codes are covered for 32 makes.

[![pub package](https://img.shields.io/pub/v/apiverve_dtclookup.svg)](https://pub.dev/packages/apiverve_dtclookup)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This is the Dart/Flutter client for the [DTC Lookup API](https://apiverve.com/marketplace/dtclookup?utm_source=dart&utm_medium=referral&utm_content=readme).

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  apiverve_dtclookup: ^1.2.4
```

Then run:

```bash
dart pub get
# or for Flutter
flutter pub get
```

## Usage

```dart
import 'package:apiverve_dtclookup/apiverve_dtclookup.dart';

void main() async {
  final client = DtclookupClient('YOUR_API_KEY');

  try {
    final response = await client.execute({
      'code': 'P0301',
      'make': 'Ford',
      'lang': 'en'
    });

    print('Status: ${response.status}');
    print('Data: ${response.data}');
  } catch (e) {
    print('Error: $e');
  }
}
```

## Response

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

## API Reference

- **API Home:** [DTC Lookup API](https://apiverve.com/marketplace/dtclookup?utm_source=dart&utm_medium=referral&utm_content=readme)
- **Documentation:** [docs.apiverve.com/ref/dtclookup](https://docs.apiverve.com/ref/dtclookup?utm_source=dart&utm_medium=referral&utm_content=readme)

## Authentication

All requests require an API key. Get yours at [apiverve.com](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme).

## License

MIT License - see [LICENSE](LICENSE) for details.

---

Built with Dart for [APIVerve](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme)
