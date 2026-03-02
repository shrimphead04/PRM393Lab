import 'package:flutter/material.dart';

/// Exercise 1 - Core Widgets Demo
/// Demonstrating basic Flutter widgets: Text, Image, Icon, Card, ListTile
class CoreWidgetsDemo extends StatelessWidget {
  const CoreWidgetsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 1 - Core Widgets'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Headline Text Widget
            const Text(
              'Welcome to Flutter UI',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Icon Widget
            const Center(
              child: Icon(Icons.video_library, size: 80, color: Colors.blue),
            ),
            const SizedBox(height: 20),

            // Image Widget using network image
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                'https://images.unsplash.com/photo-1519681393784-d120267933ba',
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 200,
                    color: Colors.grey[300],
                    child: const Center(child: Icon(Icons.error)),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),

            // Card with ListTile
            Card(
              elevation: 4,
              child: ListTile(
                leading: const Icon(Icons.movie, size: 40),
                title: const Text(
                  'Movie Item',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                  'This is a sample ListTile inside a Card.',
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Handle tap action
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
