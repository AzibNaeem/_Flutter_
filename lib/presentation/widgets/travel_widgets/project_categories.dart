enum ProjectCategories {
  project1,
  project2,
  project3,
  project4,
  project5,
}

extension ProjectCategoriesExtension on ProjectCategories {
  String get label {
    switch (this) {
      case ProjectCategories.project1:
        return 'project 1';
      case ProjectCategories.project2:
        return 'project 2';
      case ProjectCategories.project3:
        return 'project 3';
      case ProjectCategories.project4:
        return 'project 4';
      case ProjectCategories.project5:
        return 'project 5';
    }
  }
}
