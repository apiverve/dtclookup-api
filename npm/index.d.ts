declare module '@apiverve/dtclookup' {
  export interface dtclookupOptions {
    api_key: string;
    secure?: boolean;
  }

  /**
   * Describes fields the current plan does not unlock. Locked fields arrive as null
   * in `data`; `locked_fields` names them, using dot paths for nested fields.
   * Absent when the plan unlocks everything.
   */
  export interface PremiumInfo {
    message: string;
    upgrade_url: string;
    locked_fields: string[];
  }

  export interface dtclookupResponse {
    status: string;
    error: string | null;
    data: DTCLookupData;
    code?: number;
    premium?: PremiumInfo;
  }


  interface DTCLookupData {
      code:                null | string;
      found:               boolean | null;
      system:              null | string;
      subsystem:           null | string;
      codeType:            null | string;
      title:               null | string;
      description:         null | string;
      warningLight:        null | string;
      affectedComponents:  (null | string)[];
      causes:              Cause[];
      symptoms:            (null | string)[];
      repairDifficulty:    null | string;
      diyPossible:         boolean | null;
      estimatedRepairCost: EstimatedRepairCost;
      estimatedLaborHours: EstimatedLaborHours;
      emissionsRelated:    boolean | null;
      limpModePossible:    null;
      relatedCodes:        (null | string)[];
      make:                null;
      manufacturer:        null;
      availableMakes:      null;
      language:            null | string;
  }
  
  interface Cause {
      cause:      null | string;
      likelihood: null | string;
  }
  
  interface EstimatedLaborHours {
      min: number | null;
      max: number | null;
  }
  
  interface EstimatedRepairCost {
      min:      number | null;
      max:      number | null;
      currency: null | string;
  }

  export default class dtclookupWrapper {
    constructor(options: dtclookupOptions);

    execute(callback: (error: any, data: dtclookupResponse | null) => void): Promise<dtclookupResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: dtclookupResponse | null) => void): Promise<dtclookupResponse>;
    execute(query?: Record<string, any>): Promise<dtclookupResponse>;
  }
}
