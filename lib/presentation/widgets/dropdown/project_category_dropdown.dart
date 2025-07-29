import '../../../domain/enums/project_categories.dart';
import 'dropdown_item.dart';

class ProjectCategoryDropdownItem implements DropdownItem {
  final ProjectCategory category;

  ProjectCategoryDropdownItem(this.category);

  @override
  String get displayName {
    switch (category) {
      case ProjectCategory.project1:
        return "project1";
      case ProjectCategory.project2:
        return "project2";
      case ProjectCategory.project3:
        return "project3";
      case ProjectCategory.project4:
        return "project4";
      case ProjectCategory.project5:
        return "project5";
    }
  }

  @override
  get value => category;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is ProjectCategoryDropdownItem && other.category == category;

  @override
  int get hashCode => category.hashCode;
}
