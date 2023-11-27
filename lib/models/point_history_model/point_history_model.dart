class HistoriPointModel {
  int? code;
  bool? error;
  String? message;
  List<PointsHistory>? pointsHistory;

  HistoriPointModel({
    this.code,
    this.error,
    this.message,
    this.pointsHistory,
  });

  factory HistoriPointModel.fromJson(Map<String, dynamic> json) =>
      HistoriPointModel(
        code: json["code"],
        error: json["error"],
        message: json["message"],
        pointsHistory: json["points_history"] == null
            ? []
            : List<PointsHistory>.from(
                json["points_history"]!.map((x) => PointsHistory.fromJson(x))),
      );
}

class PointsHistory {
  String? message;
  int? pointsEarned;
  String? wisataName;
  int? pointsUsed;

  PointsHistory({
    this.message,
    this.pointsEarned,
    this.wisataName,
    this.pointsUsed,
  });

  factory PointsHistory.fromJson(Map<String, dynamic> json) => PointsHistory(
        message: json["message"],
        pointsEarned: json["points_earned"],
        wisataName: json["wisata_name"],
        pointsUsed: json["points_used"],
      );
}
