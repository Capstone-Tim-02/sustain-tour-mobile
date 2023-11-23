import 'dart:convert';

class CitiesModel {
    List<String> cities;
    int code;
    bool error;

    CitiesModel({
        required this.cities,
        required this.code,
        required this.error,
    });

    factory CitiesModel.fromRawJson(String str) => CitiesModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CitiesModel.fromJson(Map<String, dynamic> json) => CitiesModel(
        cities: List<String>.from(json["cities"].map((x) => x)),
        code: json["code"],
        error: json["error"],
    );

    Map<String, dynamic> toJson() => {
        "cities": List<dynamic>.from(cities.map((x) => x)),
        "code": code,
        "error": error,
    };
}
