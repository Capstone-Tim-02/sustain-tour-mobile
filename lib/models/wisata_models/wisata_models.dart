import 'dart:convert';

class WisataModel {
    int code;
    bool error;
    List<Wisata> wisatas;

    WisataModel({
        required this.code,
        required this.error,
        required this.wisatas,
    });

    factory WisataModel.fromRawJson(String str) => WisataModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory WisataModel.fromJson(Map<String, dynamic> json) => WisataModel(
        code: json["code"],
        error: json["error"],
        wisatas: List<Wisata>.from(json["wisatas"].map((x) => Wisata.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "error": error,
        "wisatas": List<dynamic>.from(wisatas.map((x) => x.toJson())),
    };
}

class Wisata {
    int id;
    String title;
    String location;
    String kota;
    String description;
    int price;
    double lat;
    double long;
    int userId;
    int availableTickets;
    String photoWisata1;
    String photoWisata2;
    String photoWisata3;
    int categoryId;
    Category category;
    String mapsLink;
    bool isOpen;
    String descriptionIsOpen;
    String fasilitas;
    String videoLink;
    DateTime createdAt;
    DateTime updatedAt;

    Wisata({
        required this.id,
        required this.title,
        required this.location,
        required this.kota,
        required this.description,
        required this.price,
        required this.lat,
        required this.long,
        required this.userId,
        required this.availableTickets,
        required this.photoWisata1,
        required this.photoWisata2,
        required this.photoWisata3,
        required this.categoryId,
        required this.category,
        required this.mapsLink,
        required this.isOpen,
        required this.descriptionIsOpen,
        required this.fasilitas,
        required this.videoLink,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Wisata.fromRawJson(String str) => Wisata.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Wisata.fromJson(Map<String, dynamic> json) => Wisata(
        id: json["id"],
        title: json["title"],
        location: json["location"],
        kota: json["kota"],
        description: json["description"],
        price: json["price"],
        lat: json["lat"]?.toDouble(),
        long: json["long"]?.toDouble(),
        userId: json["user_id"],
        availableTickets: json["available_tickets"],
        photoWisata1: json["photo_wisata1"],
        photoWisata2: json["photo_wisata2"],
        photoWisata3: json["photo_wisata3"],
        categoryId: json["category_id"],
        category: Category.fromJson(json["category"]),
        mapsLink: json["maps_link"],
        isOpen: json["is_open"],
        descriptionIsOpen: json["description_is_open"],
        fasilitas: json["fasilitas"],
        videoLink: json["video_link"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["UpdatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "location": location,
        "kota": kota,
        "description": description,
        "price": price,
        "lat": lat,
        "long": long,
        "user_id": userId,
        "available_tickets": availableTickets,
        "photo_wisata1": photoWisata1,
        "photo_wisata2": photoWisata2,
        "photo_wisata3": photoWisata3,
        "category_id": categoryId,
        "category": category.toJson(),
        "maps_link": mapsLink,
        "is_open": isOpen,
        "description_is_open": descriptionIsOpen,
        "fasilitas": fasilitas,
        "video_link": videoLink,
        "created_at": createdAt.toIso8601String(),
        "UpdatedAt": updatedAt.toIso8601String(),
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

    factory Category.fromRawJson(String str) => Category.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

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
