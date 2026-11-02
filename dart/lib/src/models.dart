/// Response models for the DTC Lookup API.

/// API Response wrapper.
class DtclookupResponse {
  final String status;
  final dynamic error;
  final DtclookupData? data;

  /// Set only when the current plan locks one or more fields; null otherwise.
  final PremiumInfo? premium;

  DtclookupResponse({
    required this.status,
    this.error,
    this.data,
    this.premium,
  });

  factory DtclookupResponse.fromJson(Map<String, dynamic> json) => DtclookupResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? DtclookupData.fromJson(json['data']) : null,
    premium: json['premium'] != null ? PremiumInfo.fromJson(json['premium']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
    if (premium != null) 'premium': premium!.toJson(),
  };
}

/// Describes fields the current plan does not unlock. Locked fields arrive as null
/// in [data], and [lockedFields] names them (nested ones use dot paths).
class PremiumInfo {
  final String? message;
  final String? upgradeUrl;
  final List<String>? lockedFields;

  PremiumInfo({this.message, this.upgradeUrl, this.lockedFields});

  factory PremiumInfo.fromJson(Map<String, dynamic> json) => PremiumInfo(
    message: json['message'] as String?,
    upgradeUrl: json['upgrade_url'] as String?,
    lockedFields: (json['locked_fields'] as List?)?.map((e) => e.toString()).toList(),
  );

  Map<String, dynamic> toJson() => {
    if (message != null) 'message': message,
    if (upgradeUrl != null) 'upgrade_url': upgradeUrl,
    if (lockedFields != null) 'locked_fields': lockedFields,
  };
}

/// Response data for the DTC Lookup API.

class DtclookupData {
  String? code;
  bool? found;
  String? system;
  String? subsystem;
  String? codeType;
  String? title;
  String? description;
  String? warningLight;
  List<String>? affectedComponents;
  List<DtclookupDataCausesItem>? causes;
  List<String>? symptoms;
  String? repairDifficulty;
  bool? diyPossible;
  DtclookupDataEstimatedrepaircost? estimatedRepairCost;
  DtclookupDataEstimatedlaborhours? estimatedLaborHours;
  bool? emissionsRelated;
  dynamic limpModePossible;
  List<String>? relatedCodes;
  dynamic make;
  dynamic manufacturer;
  dynamic availableMakes;
  String? language;

  DtclookupData({
    this.code,
    this.found,
    this.system,
    this.subsystem,
    this.codeType,
    this.title,
    this.description,
    this.warningLight,
    this.affectedComponents,
    this.causes,
    this.symptoms,
    this.repairDifficulty,
    this.diyPossible,
    this.estimatedRepairCost,
    this.estimatedLaborHours,
    this.emissionsRelated,
    this.limpModePossible,
    this.relatedCodes,
    this.make,
    this.manufacturer,
    this.availableMakes,
    this.language,
  });

  factory DtclookupData.fromJson(Map<String, dynamic> json) => DtclookupData(
      code: json['code'],
      found: json['found'],
      system: json['system'],
      subsystem: json['subsystem'],
      codeType: json['codeType'],
      title: json['title'],
      description: json['description'],
      warningLight: json['warningLight'],
      affectedComponents: (json['affectedComponents'] as List?)?.cast<String>(),
      causes: (json['causes'] as List?)?.map((e) => DtclookupDataCausesItem.fromJson(e)).toList(),
      symptoms: (json['symptoms'] as List?)?.cast<String>(),
      repairDifficulty: json['repairDifficulty'],
      diyPossible: json['diyPossible'],
      estimatedRepairCost: json['estimatedRepairCost'] != null ? DtclookupDataEstimatedrepaircost.fromJson(json['estimatedRepairCost']) : null,
      estimatedLaborHours: json['estimatedLaborHours'] != null ? DtclookupDataEstimatedlaborhours.fromJson(json['estimatedLaborHours']) : null,
      emissionsRelated: json['emissionsRelated'],
      limpModePossible: json['limpModePossible'],
      relatedCodes: (json['relatedCodes'] as List?)?.cast<String>(),
      make: json['make'],
      manufacturer: json['manufacturer'],
      availableMakes: json['availableMakes'],
      language: json['language'],
    );
}

class DtclookupDataCausesItem {
  String? cause;
  String? likelihood;

  DtclookupDataCausesItem({
    this.cause,
    this.likelihood,
  });

  factory DtclookupDataCausesItem.fromJson(Map<String, dynamic> json) => DtclookupDataCausesItem(
      cause: json['cause'],
      likelihood: json['likelihood'],
    );
}

class DtclookupDataEstimatedrepaircost {
  num? min;
  num? max;
  String? currency;

  DtclookupDataEstimatedrepaircost({
    this.min,
    this.max,
    this.currency,
  });

  factory DtclookupDataEstimatedrepaircost.fromJson(Map<String, dynamic> json) => DtclookupDataEstimatedrepaircost(
      min: json['min'],
      max: json['max'],
      currency: json['currency'],
    );
}

class DtclookupDataEstimatedlaborhours {
  num? min;
  num? max;

  DtclookupDataEstimatedlaborhours({
    this.min,
    this.max,
  });

  factory DtclookupDataEstimatedlaborhours.fromJson(Map<String, dynamic> json) => DtclookupDataEstimatedlaborhours(
      min: json['min'],
      max: json['max'],
    );
}

class DtclookupRequest {
  String code;
  String? make;
  String? lang;

  DtclookupRequest({
    required this.code,
    this.make,
    this.lang,
  });

  Map<String, dynamic> toJson() => {
      'code': code,
      if (make != null) 'make': make,
      if (lang != null) 'lang': lang,
    };
}
