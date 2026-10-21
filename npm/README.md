# DTC Lookup API

DTC Lookup explains OBD-II diagnostic trouble codes such as P0301 or U0100. It returns the code's system and standard title, which warning light it turns on, and on paid plans the full description, likely causes ranked by likelihood, symptoms, repair difficulty, estimated cost and labor hours, and related codes. Carmaker-specific codes are covered for 32 makes.

[![npm version](https://img.shields.io/npm/v/@apiverve/dtclookup.svg)](https://www.npmjs.com/package/@apiverve/dtclookup)

This is a JavaScript wrapper for the [DTC Lookup API](https://apiverve.com/marketplace/dtclookup?utm_source=npm&utm_medium=referral&utm_content=readme)

---

## Installation

Using npm:
```shell
npm install @apiverve/dtclookup
```

Using yarn:
```shell
yarn add @apiverve/dtclookup
```

---

## Configuration

Before using the DTC Lookup API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=npm&utm_medium=referral&utm_content=readme)

---

## Quick Start

[Get started with the Quick Start Guide](https://docs.apiverve.com/quickstart?utm_source=npm&utm_medium=referral&utm_content=readme)

The DTC Lookup API documentation is found here: [https://docs.apiverve.com/ref/dtclookup](https://docs.apiverve.com/ref/dtclookup?utm_source=npm&utm_medium=referral&utm_content=readme).
You can find parameters, example responses, and status codes documented here.

### Setup

```javascript
const dtclookupAPI = require('@apiverve/dtclookup');
const api = new dtclookupAPI({
    api_key: '[YOUR_API_KEY]'
});
```

---

## Usage

---

### Perform Request

Using the API is simple. All you have to do is make a request. The API will return a response with the data you requested.

```javascript
var query = {
  code: "P0301",
  make: "Ford",
  lang: "en"
};

api.execute(query, function (error, data) {
    if (error) {
        return console.error(error);
    } else {
        console.log(data);
    }
});
```

---

### Using Promises

You can also use promises to make requests. The API returns a promise that you can use to handle the response.

```javascript
var query = {
  code: "P0301",
  make: "Ford",
  lang: "en"
};

api.execute(query)
    .then(data => {
        console.log(data);
    })
    .catch(error => {
        console.error(error);
    });
```

---

### Using Async/Await

You can also use async/await to make requests. The API returns a promise that you can use to handle the response.

```javascript
async function makeRequest() {
    var query = {
  code: "P0301",
  make: "Ford",
  lang: "en"
};

    try {
        const data = await api.execute(query);
        console.log(data);
    } catch (error) {
        console.error(error);
    }
}
```

---

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

---

## Customer Support

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=npm&utm_medium=referral&utm_content=readme).

---

## Updates

Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=npm&utm_medium=referral&utm_content=readme) and [Privacy Policy](https://apiverve.com/privacy?utm_source=npm&utm_medium=referral&utm_content=readme).

---

## License
Licensed under the MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
