import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum MiscInfoType { text, dropdown, date }

class MiscInfoItem {
  final String label;
  final String value;
  final MiscInfoType type;

  const MiscInfoItem({
    required this.label,
    required this.value,
    this.type = MiscInfoType.text,
  });
}

class MiscellaneousInfoCard extends StatelessWidget{
  final List<MiscInfoItem> items;

  const MiscellaneousInfoCard({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.label, style: TextStyle(color: Colors.grey[600])),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          item.value,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                      IconButton(
                        icon:
                            const Icon(Icons.edit_outlined, color: Colors.grey),
                        onPressed: () {},
                      ),
                      if (item.type == MiscInfoType.dropdown)
                        const Icon(Icons.arrow_drop_down, color: Colors.grey),
                      if (item.type == MiscInfoType.date)
                        const Icon(Icons.calendar_today_outlined,
                            color: Colors.grey, size: 20),
                    ],
                  ),
                  const Divider(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
