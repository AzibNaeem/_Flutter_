class LoginUser {
  final String email;
  final String password;
  final String employeeId;

  LoginUser({
    required this.email,
    required this.password,
    required this.employeeId,
  });

  factory LoginUser.fromJson(Map<String, dynamic> json) {
    return LoginUser(
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      employeeId: json['employee_id'] ?? '',
    );
  }
}
