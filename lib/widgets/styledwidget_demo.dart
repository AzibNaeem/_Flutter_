import 'package:flutter/material.dart';

class StyledWidgetDemo extends StatelessWidget {
  const StyledWidgetDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: const Text('Styled Widget Demo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("Screen Width: ${screenWidth.toStringAsFixed(0)} px"),


              Container(
                width: screenWidth * 0.9,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.blueGrey),
                ),
                child: Column(
                  children: [
                    Text(
                      'Welcome to Flutter Styling!',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'This card is responsive and themed.',
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Container(
                width: screenWidth * 0.8,
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black26),
                ),
                child: Column(
                  children: const [
                    Text(
                      'Compact Container',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Tighter padding, smaller text.',
                      style: TextStyle(fontSize: 13),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
              
              Container(
                width: screenWidth * 0.95,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Theme.of(context).colorScheme.secondary),
                ),
                child: Column(
                  children: [
                    Text(
                      'Theme Styled Card',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'This container uses Theme colors and dynamic width.',
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
