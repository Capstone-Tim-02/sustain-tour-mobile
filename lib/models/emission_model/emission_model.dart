// To parse this JSON data, do
//
//     final emissionModel = emissionModelFromJson(jsonString);

import 'dart:convert';

EmissionModel emissionModelFromJson(String str) =>
    EmissionModel.fromJson(json.decode(str));

String emissionModelToJson(EmissionModel data) => json.encode(data.toJson());

class EmissionModel {
  int code;
  int equivalentPoweringHouseInHours;
  bool error;
  int roundedTotalCarbonFootprint;

  EmissionModel({
    required this.code,
    required this.equivalentPoweringHouseInHours,
    required this.error,
    required this.roundedTotalCarbonFootprint,
  });

  factory EmissionModel.fromJson(Map<String, dynamic> json) => EmissionModel(
        code: json["code"],
        equivalentPoweringHouseInHours:
            json["equivalent_powering_house_in_hours"],
        error: json["error"],
        roundedTotalCarbonFootprint: json["rounded_total_carbon_footprint"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "equivalent_powering_house_in_hours": equivalentPoweringHouseInHours,
        "error": error,
        "rounded_total_carbon_footprint": roundedTotalCarbonFootprint,
      };
}
