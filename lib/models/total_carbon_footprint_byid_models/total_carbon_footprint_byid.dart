class TotalCarbonFootprintById {
  final int code;
  final bool error;
  final double totalCarbonFootprint;

  TotalCarbonFootprintById({
    required this.code,
    required this.error,
    required this.totalCarbonFootprint,
  });

  factory TotalCarbonFootprintById.fromJson(Map<String, dynamic> json) {
    return TotalCarbonFootprintById(
      code: json['code'] ?? 0,
      error: json['error'] ?? false,
      totalCarbonFootprint: json['total_carbon_footprint'] ?? 0.0,
    );
  }
}
