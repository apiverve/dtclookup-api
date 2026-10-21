# [DTC Lookup API](https://apiverve.com/marketplace/dtclookup?utm_source&#x3D;github&amp;utm_medium&#x3D;referral&amp;utm_content&#x3D;readme)

DTC Lookup explains OBD-II diagnostic trouble codes such as P0301 or U0100. It returns the code&#x27;s system and standard title, which warning light it turns on, and on paid plans the full description, likely causes ranked by likelihood, symptoms, repair difficulty, estimated cost and labor hours, and related codes. Carmaker-specific codes are covered for 32 makes.

The DTC Lookup API provides a simple, reliable way to integrate dtc lookup functionality into your applications. Built for developers who need production-ready dtc lookup capabilities without the complexity of building from scratch.

**[View API Details →](https://apiverve.com/marketplace/dtclookup?utm_source&#x3D;github&amp;utm_medium&#x3D;referral&amp;utm_content&#x3D;readme)**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![API Status](https://img.shields.io/badge/Status-Active-green.svg)](https://apiverve.com/marketplace/dtclookup?utm_source&#x3D;github&amp;utm_medium&#x3D;referral&amp;utm_content&#x3D;readme)
[![Method](https://img.shields.io/badge/Method-GET-blue.svg)](#)
[![Platform](https://img.shields.io/badge/Platform-Multi--Platform-orange.svg)](#installation)

**Available on:**
[![npm](https://img.shields.io/badge/npm-CB3837?style=flat&logo=npm&logoColor=white)](https://www.npmjs.com/package/@apiverve/dtclookup)
[![NuGet](https://img.shields.io/badge/NuGet-004880?style=flat&logo=nuget&logoColor=white)](https://www.nuget.org/packages/APIVerve.API.DTCLookup)
[![PyPI](https://img.shields.io/badge/PyPI-3776AB?style=flat&logo=python&logoColor=white)](https://pypi.org/project/apiverve-dtclookup/)
[![RubyGems](https://img.shields.io/badge/RubyGems-E9573F?style=flat&logo=rubygems&logoColor=white)](https://rubygems.org/gems/apiverve_dtclookup)
[![Packagist](https://img.shields.io/badge/Packagist-F28D1A?style=flat&logo=packagist&logoColor=white)](https://packagist.org/packages/apiverve/dtclookup)
[![Go](https://img.shields.io/badge/Go-00ADD8?style=flat&logo=go&logoColor=white)](#-go)
[![Dart](https://img.shields.io/badge/Dart-0175C2?style=flat&logo=dart&logoColor=white)](https://pub.dev/packages/apiverve_dtclookup)
[![JitPack](https://img.shields.io/badge/JitPack-2E7D32?style=flat&logo=android&logoColor=white)](#-android-jitpack)

---

## Quick Start

### Using JavaScript

```javascript
async function callDTCLookupAPI() {
    try {
        const params = new URLSearchParams({
            code: 'P0301',
            make: 'Ford',
            lang: 'en'
        });

        const response = await fetch(`https://api.apiverve.com/v1/dtclookup?${params}`, {
            method: 'GET',
            headers: {
                'x-api-key': 'YOUR_API_KEY_HERE'
            }
        });

        const data = await response.json();
        console.log(data);
    } catch (error) {
        console.error('Error:', error);
    }
}

callDTCLookupAPI();
```

### Using cURL

```bash
curl -X GET "https://api.apiverve.com/v1/dtclookup?code=P0301&make=Ford&lang=en" \
  -H "x-api-key: YOUR_API_KEY_HERE"
```

**Get your API key:** [https://apiverve.com](https://apiverve.com)

**📁 For more examples, see the [examples folder](./examples/)**

---

## Installation

Choose your preferred programming language:

### 📦 NPM (JavaScript/Node.js)

```bash
npm install @apiverve/dtclookup
```

[**View NPM Package →**](https://www.npmjs.com/package/@apiverve/dtclookup) | [**Package Code →**](./npm/)

---

### 🔷 NuGet (.NET/C#)

```bash
dotnet add package APIVerve.API.DTCLookup
```

[**View NuGet Package →**](https://www.nuget.org/packages/APIVerve.API.DTCLookup) | [**Package Code →**](./nuget/)

---

### 🐍 Python (PyPI)

```bash
pip install apiverve-dtclookup
```

[**View PyPI Package →**](https://pypi.org/project/apiverve-dtclookup/) | [**Package Code →**](./python/)

---

### 💎 Ruby (RubyGems)

```bash
gem install apiverve_dtclookup
```

[**View RubyGems Package →**](https://rubygems.org/gems/apiverve_dtclookup) | [**Package Code →**](./ruby/)

---

### 🐘 PHP (Packagist)

```bash
composer require apiverve/dtclookup
```

[**View Packagist Package →**](https://packagist.org/packages/apiverve/dtclookup) | [**Package Code →**](./php/)

---

### 🎯 Dart (pub.dev)

```bash
dart pub add apiverve_dtclookup
```

[**View pub.dev Package →**](https://pub.dev/packages/apiverve_dtclookup) | [**Package Code →**](./dart/)

---

### 🤖 Android (JitPack)

```gradle
implementation 'com.github.apiverve:dtclookup-api:1.0.0'
```

[**Package Code →**](./android/)

---

### 🐹 Go

```bash
go get github.com/apiverve/dtclookup-api/go
```

[**Package Code →**](./go/)

---

## Why Use This API?

| Feature | Benefit |
|---------|---------|
| **Multi-language SDKs** | Native packages for JavaScript, Python, C#, Go, and Android |
| **Simple Integration** | Single API key authentication, consistent response format |
| **Production Ready** | 99.9% uptime SLA, served from 24 global regions |
| **Comprehensive Docs** | Full examples, OpenAPI spec, and dedicated support |

---

## Documentation

- 🏠 **API Home:** [DTC Lookup API](https://apiverve.com/marketplace/dtclookup?utm_source&#x3D;github&amp;utm_medium&#x3D;referral&amp;utm_content&#x3D;readme)
- 📚 **API Reference:** [docs.apiverve.com/ref/dtclookup](https://docs.apiverve.com/ref/dtclookup)
- 📖 **OpenAPI Spec:** [openapi.yaml](./openapi.yaml)
- 💡 **Examples:** [examples/](./examples/)

---

## What Can You Build?

The DTC Lookup API is commonly used for:

- **Web Applications** - Add dtc lookup features to your frontend or backend
- **Mobile Apps** - Native SDKs for Android development
- **Automation** - Integrate with n8n, Zapier, or custom workflows
- **SaaS Products** - Enhance your product with dtc lookup capabilities
- **Data Pipelines** - Process and analyze data at scale

---

## API Reference

### Authentication
All requests require an API key in the header:
```
x-api-key: YOUR_API_KEY_HERE
```

Get your API key: [https://apiverve.com](https://apiverve.com)

### Response Format

Every APIVerve endpoint returns the same envelope — check `status`, then read `data`:

```json
{
  "status": "ok",
  "error": null,
  "data": { ... }
}
```

### Example Response

A real response from the DTC Lookup API:

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

---

## Support & Community

- 🏠 **API Home**: [DTC Lookup API](https://apiverve.com/marketplace/dtclookup?utm_source&#x3D;github&amp;utm_medium&#x3D;referral&amp;utm_content&#x3D;readme)
- 💬 **Support**: [https://apiverve.com/contact](https://apiverve.com/contact)
- 🐛 **Issues**: [GitHub Issues](../../issues)
- 📖 **Documentation**: [https://docs.apiverve.com](https://docs.apiverve.com)
- 🌐 **Website**: [https://apiverve.com](https://apiverve.com)

---

## Contributing

We welcome contributions! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

---

## Security

For security concerns, please review our [Security Policy](SECURITY.md).

---

## License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

---

## Acknowledgments

Built with ❤️ by [APIVerve](https://apiverve.com)

Copyright © 2026 APIVerve. All rights reserved.
