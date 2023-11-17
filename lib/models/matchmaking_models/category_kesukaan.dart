class CategoryKesukan {
  final int id;
  final String name;
  final String username;
  final String email;
  final String phoneNumber;
  final String photoProfile;
  final String categoryKesukaan;
  final int categoryId;

  CategoryKesukan({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.photoProfile,
    required this.categoryKesukaan,
    required this.categoryId,
  });

  factory CategoryKesukan.fromJson(Map<String, dynamic> json) {
    return CategoryKesukan(
      id: json['user']['id'] as int,
      name: json['user']['name'] as String,
      username: json['user']['username'] as String,
      email: json['user']['email'] as String,
      phoneNumber: json['user']['phone_number'] as String,
      photoProfile: json['user']['photo_profil'] as String,
      categoryKesukaan: json['user']['category_kesukaan'] as String,
      categoryId: json['user']['category_id'] as int,
    );
  }
}
