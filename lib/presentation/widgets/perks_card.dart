import 'package:flutter/material.dart';

class Perk {
  final IconData icon;
  final String title;
  final String? subtitle;
  final bool hasCheckbox;

  const Perk({
    required this.icon,
    required this.title,
    this.subtitle,
    this.hasCheckbox = false,
  });
}

class PerksCard extends StatelessWidget {
  final List<Perk> perks;
  const PerksCard({super.key, required this.perks});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: perks.length,
          itemBuilder: (context, index) {
            final perk = perks[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    child: Icon(perk.icon, color: Colors.grey[600]),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(perk.title),
                        if (perk.subtitle != null) Text(perk.subtitle!),
                      ],
                    ),
                  ),
                  if (perk.hasCheckbox) Checkbox(value: false, onChanged: (v) {}),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
