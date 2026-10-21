DTC Lookup API
============

DTC Lookup explains OBD-II diagnostic trouble codes such as P0301 or U0100. It returns the code's system and standard title, which warning light it turns on, and on paid plans the full description, likely causes ranked by likelihood, symptoms, repair difficulty, estimated cost and labor hours, and related codes. Carmaker-specific codes are covered for 32 makes.


[![PyPI version](https://img.shields.io/pypi/v/apiverve-dtclookup.svg)](https://pypi.org/project/apiverve-dtclookup/)

This is a Python wrapper for the [DTC Lookup API](https://apiverve.com/marketplace/dtclookup?utm_source=pypi&utm_medium=referral&utm_content=readme)

---

## Installation

Using `pip`:

```bash
pip install apiverve-dtclookup
```

Using `pip3`:

```bash
pip3 install apiverve-dtclookup
```

---

## Configuration

Before using the DTC Lookup API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=pypi&utm_medium=referral&utm_content=readme)

---

## Quick Start

Here's a simple example to get you started quickly:

```python
from apiverve_dtclookup.apiClient import DtclookupAPIClient

# Initialize the client with your APIVerve API key
api = DtclookupAPIClient("[YOUR_API_KEY]")

query = {
    "code": "P0301",
    "make": "Ford",
    "lang": "en"
}

try:
    # Make the API call
    result = api.execute(query)

    # Print the result
    print(result)
except Exception as e:
    print(f"Error: {e}")
```

---

## Usage

The DTC Lookup API documentation is found here: [https://docs.apiverve.com/ref/dtclookup](https://docs.apiverve.com/ref/dtclookup?utm_source=pypi&utm_medium=referral&utm_content=readme).
You can find parameters, example responses, and status codes documented here.

### Setup

```python
# Import the client module
from apiverve_dtclookup.apiClient import DtclookupAPIClient

# Initialize the client with your APIVerve API key
api = DtclookupAPIClient("[YOUR_API_KEY]")
```

---

## Perform Request

Using the API client, you can perform requests to the API.

###### Define Query

```python
query = {
    "code": "P0301",
    "make": "Ford",
    "lang": "en"
}
```

###### Simple Request

```python
# Make a request to the API
result = api.execute(query)

# Print the result
print(result)
```

###### Example Response

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

## Error Handling

The API client provides comprehensive error handling through the `DtclookupAPIClientError` exception. Here are some examples:

### Basic Error Handling

```python
from apiverve_dtclookup.apiClient import DtclookupAPIClient, DtclookupAPIClientError

api = DtclookupAPIClient("[YOUR_API_KEY]")

query = {
    "code": "P0301",
    "make": "Ford",
    "lang": "en"
}

try:
    result = api.execute(query)
    print("Success!")
    print(result)
except DtclookupAPIClientError as e:
    print(f"API Error: {e.message}")
    if e.status_code:
        print(f"Status Code: {e.status_code}")
    if e.response:
        print(f"Response: {e.response}")
```

### Handling Specific Error Types

```python
from apiverve_dtclookup.apiClient import DtclookupAPIClient, DtclookupAPIClientError

api = DtclookupAPIClient("[YOUR_API_KEY]")

query = {
    "code": "P0301",
    "make": "Ford",
    "lang": "en"
}

try:
    result = api.execute(query)

    # Check for successful response
    if result.get('status') == 'success':
        print("Request successful!")
        print(result.get('data'))
    else:
        print(f"API returned an error: {result.get('error')}")

except DtclookupAPIClientError as e:
    # Handle API client errors
    if e.status_code == 401:
        print("Unauthorized: Invalid API key")
    elif e.status_code == 429:
        print("Rate limit exceeded")
    elif e.status_code >= 500:
        print("Server error - please try again later")
    else:
        print(f"API error: {e.message}")
except Exception as e:
    # Handle unexpected errors
    print(f"Unexpected error: {str(e)}")
```

### Using Context Manager (Recommended)

The client supports the context manager protocol for automatic resource cleanup:

```python
from apiverve_dtclookup.apiClient import DtclookupAPIClient, DtclookupAPIClientError

query = {
    "code": "P0301",
    "make": "Ford",
    "lang": "en"
}

# Using context manager ensures proper cleanup
with DtclookupAPIClient("[YOUR_API_KEY]") as api:
    try:
        result = api.execute(query)
        print(result)
    except DtclookupAPIClientError as e:
        print(f"Error: {e.message}")
# Session is automatically closed here
```

---

## Advanced Features

### Debug Mode

Enable debug logging to see detailed request and response information:

```python
from apiverve_dtclookup.apiClient import DtclookupAPIClient

# Enable debug mode
api = DtclookupAPIClient("[YOUR_API_KEY]", debug=True)

query = {
    "code": "P0301",
    "make": "Ford",
    "lang": "en"
}

# Debug information will be printed to console
result = api.execute(query)
```

### Manual Session Management

If you need to manually manage the session lifecycle:

```python
from apiverve_dtclookup.apiClient import DtclookupAPIClient

api = DtclookupAPIClient("[YOUR_API_KEY]")

query = {
    "code": "P0301",
    "make": "Ford",
    "lang": "en"
}

try:
    result = api.execute(query)
    print(result)
finally:
    # Manually close the session when done
    api.close()
```

---

## Customer Support

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=pypi&utm_medium=referral&utm_content=readme).

---

## Updates
Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=pypi&utm_medium=referral&utm_content=readme) and all legal documents and agreements.

---

## License
Licensed under the MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
