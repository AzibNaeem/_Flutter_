import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
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
    final size = MediaQuery.of(context).size;
    AppColors.init(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: size.height * 0.01,
        horizontal: size.width * 0.03,
      ),
      child: Material(
        elevation: 4,
        shadowColor: Colors.black26,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.white, width: 1.5),
          ),
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
          child: DropdownButtonFormField<T>(
            value: selectedItem,
            decoration: InputDecoration(
              labelText: hint,
              labelStyle: TextStyle(
                color: Colors.black.withOpacity(0.7),
                fontSize: size.width * 0.035,
              ),
              border: InputBorder.none,
            ),
            dropdownColor: Colors.white,
            iconEnabledColor: Colors.black,
            style: TextStyle(color: Colors.black, fontSize: size.width * 0.04),
            items: items.map((item) {
              return DropdownMenuItem<T>(
                value: item,
                child: Text(
                  item.displayName,
                  style: TextStyle(color: Colors.black, fontSize: size.width * 0.04),
                ),
              );
            }).toList(),
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}
