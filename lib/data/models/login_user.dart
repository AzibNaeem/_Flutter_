class LoginUser {
  final String employeeId;
  final String email;
  final String name;
  final String role;

  LoginUser({
    required this.employeeId,
    required this.email,
    required this.name,
    required this.role,
  });

  factory LoginUser.fromJson(Map<String, dynamic> json) {
    return LoginUser(
      employeeId: json['employee_id'],
      email: json['email'],
      name: json['name'],
      role: json['role'],
    );
  }
}
