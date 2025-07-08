class LoginUser {
  final String email;
  final String password;
  final String employeeId;
  final String name;
  final String role;

  LoginUser({
    required this.email,
    required this.password,
    required this.employeeId,
    required this.name,
    required this.role,
  });

  factory LoginUser.fromJson(Map<String, dynamic> json) {
    return LoginUser(
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      employeeId: json['employee_id'] ?? '',
      name: json['name'] ?? '',
      role: json['role'] ?? '',
    );
  }
}
