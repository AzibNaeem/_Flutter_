class LoginRequest {
  final String input; // email OR employeeId
  final String password;

  LoginRequest({required this.input, required this.password});

  Map<String, dynamic> toJson() {
    return {
      'input': input,
      'password': password,
    };
  }
}
