class LoginModels {
  final int code;
  final bool error;
  final int id;
  final String message;
  final String token;

  LoginModels({
    required this.code,
    required this.error,
    required this.id,
    required this.message,
    required this.token,
  });

  factory LoginModels.fromJson(Map<String, dynamic> json) {
    return LoginModels(
      code: json['code'],
      error: json['error'],
      id: json['id'],
      message: json['message'],
      token: json['token'],
    );
  }
}
