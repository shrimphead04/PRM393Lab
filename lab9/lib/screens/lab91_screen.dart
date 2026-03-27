import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Lab91Screen extends StatefulWidget {
  const Lab91Screen({super.key});

  @override
  State<Lab91Screen> createState() => _Lab91ScreenState();
}

class _Lab91ScreenState extends State<Lab91Screen> {
  List products = [];

  Future<void> loadJson() async {
    // Reading JSON from assets as required in Lab 9.1
    String data = await rootBundle.loadString('assets/data/products.json');
    final decoded = jsonDecode(data);
    setState(() {
      products = decoded;
    });
  }

  @override
  void initState() {
    super.initState();
    loadJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lab 9.1 - Assets JSON"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: products.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final item = products[index];
                return Card(
                  elevation: 3,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Colors.indigoAccent,
                      child: Icon(Icons.inventory_2, color: Colors.white),
                    ),
                    title: Text(
                      item['name'],
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    subtitle: Text("Price: \$${item['price']}", style: const TextStyle(color: Colors.green, fontWeight: FontWeight.w500)),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  ),
                );
              },
            ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(12),
        color: Colors.grey[200],
        child: const Text(
          "Developer: Nguyễn Hoàng Việt",
          textAlign: TextAlign.center,
          style: TextStyle(fontStyle: FontStyle.italic, color: Colors.indigo),
        ),
      ),
    );
  }
}
