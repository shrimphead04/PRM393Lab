import 'package:flutter/material.dart';

/// Exercise 3 - Layout Demo
/// Demonstrating layout widgets: Column, Row, Padding, ListView
class LayoutDemo extends StatelessWidget {
  const LayoutDemo({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample movie data
    final List<Map<String, String>> movies = [
      {'title': 'Avatar', 'description': 'Sample description'},
      {'title': 'Inception', 'description': 'Sample description'},
      {'title': 'Interstellar', 'description': 'Sample description'},
      {'title': 'Joker', 'description': 'Sample description'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 3 - Layout Demo'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header section with padding
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Center(
              child: Text(
                'Now Playing',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 8),

          // ListView section
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: movies.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Card(
                    elevation: 2,
                    color: Colors.blue[50],
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue[100],
                        child: Text(
                          movies[index]['title']![0],
                          style: TextStyle(
                            color: Colors.blue[900],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      title: Text(
                        movies[index]['title']!,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(movies[index]['description']!),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
