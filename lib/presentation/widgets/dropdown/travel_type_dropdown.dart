import '../../../data/models/travel_type.dart';
import '../../../domain/enums/travel_type.dart';
import 'dropdown_item.dart';

class TravelTypeDropdownItem implements DropdownItem {
  final TravelTypes category;

  TravelTypeDropdownItem(this.category);

  @override
  String get displayName {
    switch (category) {
      case TravelTypes.domestic:
        return "Domestic";
      case TravelTypes.international:
        return "International";
    }
  }

  @override
  get value => category;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is TravelTypeDropdownItem && other.category == category;

  @override
  int get hashCode => category.hashCode;
}
