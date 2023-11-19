class RegisterModels {
  final int code;
  final int id;
  final String message;
  final String token;

  RegisterModels({
    required this.code,
    required this.id,
    required this.message,
    required this.token,
  });

  factory RegisterModels.fromJson(Map<String, dynamic> json) {
    return RegisterModels(
      code: json['code'],
      id: json['id'],
      message: json['message'],
      token: json['token'],
    );
  }
}
