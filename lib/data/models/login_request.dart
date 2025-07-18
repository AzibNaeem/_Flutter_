class LoginRequest {
  final String input;
  final String password;

  LoginRequest({required this.input, required this.password});

  Map<String, dynamic> toJson() => {
    'input': input,
    'password': password,
  };
}
