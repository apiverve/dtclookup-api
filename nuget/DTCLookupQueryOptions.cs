using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace APIVerve.API.DTCLookup
{
    /// <summary>
    /// Query options for the DTC Lookup API
    /// </summary>
    public class DTCLookupQueryOptions
    {
        /// <summary>
        /// The OBD-II trouble code: P, B, C or U followed by four characters, for example P0301, U0100 or P2BAC
        /// </summary>
        [JsonProperty("code")]
        public string Code { get; set; }

        /// <summary>
        /// The vehicle make, for carmaker-specific codes, for example Ford, Chevrolet or Volkswagen
        /// </summary>
        [JsonProperty("make")]
        public string Make { get; set; }

        /// <summary>
        /// Language of the title, description, causes and symptoms of generic codes
        /// </summary>
        [JsonProperty("lang")]
        public string Lang { get; set; }
    }
}
