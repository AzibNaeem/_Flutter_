class Department {
  final int id;
  final String name;
  final int? parentId; // null if it's a top-level department

  Department({required this.id, required this.name, this.parentId});

  factory Department.fromJson(Map<String, dynamic> json) {
    return Department(
      id: json['id'],
      name: json['name'],
      parentId: json['parent_id'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'parent_id': parentId,
  };
}
