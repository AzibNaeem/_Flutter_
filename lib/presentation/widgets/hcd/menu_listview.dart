import 'package:flutter/material.dart';
import '../../../data/models/menu_item.dart';
import '../../theme/app_theme.dart';

class MenuListView extends StatelessWidget {
  final MenuModel? menu;

  const MenuListView({super.key, required this.menu});

  @override
  Widget build(BuildContext context) {
    if (menu == null) {
      return const Center(
        child: Text(
          "No menu available for this day.",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      );
    }

    return Card(
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Colors.white,

      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Today's Lunch Options",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(height: 16),

            _buildOption("Option 1", menu!.option1),
            _buildOption("Option 2", menu!.option2),
            _buildOption("Option 3", menu!.option3),

            const Divider(height: 32, thickness: 1, color: Colors.grey),

            const Text(
              "Dinner",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
            ),
            const SizedBox(height: 8),
            Text(
              menu!.dinner,
              style: TextStyle(fontSize: 16, color: AppColors.black),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOption(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          const Icon(Icons.fastfood, color: Colors.black, size: 20),
          const SizedBox(width: 10),
          Text(
            "$label: ",
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 16, color: Colors.black),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
