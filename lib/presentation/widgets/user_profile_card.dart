import 'package:flutter/material.dart';

class UserProfileCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String role;
  final String email;
  final String phone;
  final String id;

  const UserProfileCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.role,
    required this.email,
    required this.phone,
    required this.id,
  });

  /// Default profile card for Ali Afzal
  static Widget defaultCard() {
    return const UserProfileCard(
      name: 'Ali Afzal',
      role: 'Senior HR Executive',
      email: 'ali.afzal@netsoltech.com',
      phone: '03007869139',
      imageUrl: 'https://www.google.com/imgres?q=avatar%20url&imgurl=https%3A%2F%2Fnretnil.com%2Favatar%2FLawrenceEzekielAmos.png&imgrefurl=https%3A%2F%2Fnretnil.com%2Favatar%2F&docid=RwVJflQma2kwNM&tbnid=raqp-gusRRVL6M&vet=12ahUKEwjK5p6K9pqOAxVPXfEDHSvzIiAQM3oECCYQAA..i&w=400&h=400&hcb=2&ved=2ahUKEwjK5p6K9pqOAxVPXfEDHSvzIiAQM3oECCYQAA',
      id: '6182',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(imageUrl),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      name,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      role,
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      email,
                      style: const TextStyle(color: Colors.blue),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      phone,
                      style: const TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 50,
            color: const Color(0xFF1A237E), // Dark blue
            child: Center(
              child: Text(
                id,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
