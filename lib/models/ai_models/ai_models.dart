import 'dart:convert';

AiModels aiModelsFromJson(String str) => AiModels.fromJson(json.decode(str));

String aiModelsToJson(AiModels data) => json.encode(data.toJson());

class AiModels {
    String? status;
    String? data;

    AiModels({
        this.status,
        this.data,
    });

    factory AiModels.fromJson(Map<String, dynamic> json) => AiModels(
        status: json["status"],
        data: json["data"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data,
    };
}
