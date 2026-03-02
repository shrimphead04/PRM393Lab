import 'package:flutter/material.dart';

/// Exercise 4 - App Structure & Theme
/// Demonstrating Scaffold, AppBar, FAB, and ThemeData with Dark Mode toggle
class AppStructureDemo extends StatefulWidget {
  const AppStructureDemo({super.key});

  @override
  State<AppStructureDemo> createState() => _AppStructureDemoState();
}

class _AppStructureDemoState extends State<AppStructureDemo> {
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Theme configuration
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[900],
      ),
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: Scaffold(
        // AppBar
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text('Exercise 4 - App Structure'),
          actions: [
            // Dark Mode Toggle
            Row(
              children: [
                const Text('Dark'),
                Switch(
                  value: _isDarkMode,
                  onChanged: (bool value) {
                    setState(() {
                      _isDarkMode = value;
                    });
                  },
                ),
              ],
            ),
          ],
        ),

        // Body
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.apps,
                  size: 80,
                  color: _isDarkMode ? Colors.white : Colors.blue,
                ),
                const SizedBox(height: 20),
                Text(
                  'This is a simple screen with theme toggle.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: _isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Current theme: ${_isDarkMode ? 'Dark' : 'Light'}',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: _isDarkMode ? Colors.white70 : Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ),

        // FloatingActionButton
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Show a simple message
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('FloatingActionButton pressed!'),
                duration: Duration(seconds: 2),
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
