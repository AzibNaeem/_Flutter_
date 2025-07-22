import 'package:flutter/material.dart';
import 'dropdown_item.dart';

class GenericDropdown<T extends DropdownItem> extends StatelessWidget {
  final List<T> items;
  final T? selectedItem;
  final ValueChanged<T?> onChanged;
  final String hint;

  const GenericDropdown({
    Key? key,
    required this.items,
    required this.selectedItem,
    required this.onChanged,
    required this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<T>(
      value: selectedItem,
      hint: Text(hint),
      items: items.map((item) {
        return DropdownMenuItem<T>(
          value: item,
          child: Text(item.displayName),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}