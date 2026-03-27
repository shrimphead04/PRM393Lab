import 'package:flutter/material.dart';
import 'screens/lab91_screen.dart';
import 'screens/lab92_screen.dart';
import 'screens/lab93_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 9 ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LAB 9 - Local JSON Storage"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.indigo,
              child: Icon(Icons.storage, size: 50, color: Colors.white),
            ),
            const SizedBox(height: 20),
            const Text(
              "Nguyễn Hoàng Việt - Lab 9",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.indigo),
            ),
            const SizedBox(height: 30),
            _buildMenuButton(
              context, 
              "Lab 9.1 - Read JSON Assets", 
              Icons.file_open, 
              const Lab91Screen()
            ),
            const SizedBox(height: 15),
            _buildMenuButton(
              context, 
              "Lab 9.2 - Save Local Storage", 
              Icons.save_alt, 
              const Lab92Screen()
            ),
            const SizedBox(height: 15),
            _buildMenuButton(
              context, 
              "Lab 9.3 - JSON CRUD Database", 
              Icons.edit_note, 
              const Lab93Screen()
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuButton(BuildContext context, String title, IconData icon, Widget screen) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      icon: Icon(icon),
      label: Text(title, style: const TextStyle(fontSize: 16)),
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => screen),
      ),
    );
  }
}
