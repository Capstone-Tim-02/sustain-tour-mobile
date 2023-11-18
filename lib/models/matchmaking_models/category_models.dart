class CategoryModels {
  List<Category> categories;
  int code;
  bool error;

  CategoryModels({
    required this.categories,
    required this.code,
    required this.error,
  });

  factory CategoryModels.fromJson(Map<String, dynamic> json) => CategoryModels(
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
        code: json["code"],
        error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "code": code,
        "error": error,
      };
}

class Category {
  int id;
  String categoryName;
  DateTime createdAt;

  Category({
    required this.id,
    required this.categoryName,
    required this.createdAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        categoryName: json["category_name"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_name": categoryName,
        "created_at": createdAt.toIso8601String(),
      };
}
