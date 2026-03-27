import 'package:flutter/material.dart';
import '../services/storage_service.dart';

class Lab92Screen extends StatefulWidget {
  const Lab92Screen({super.key});

  @override
  State<Lab92Screen> createState() => _Lab92ScreenState();
}

class _Lab92ScreenState extends State<Lab92Screen> {
  final StorageService storage = StorageService();
  final TextEditingController controller = TextEditingController();
  List items = [];

  @override
  void initState() {
    super.initState();
    load();
  }

  void load() async {
    items = await storage.readData();
    setState(() {});
  }

  void addItem() {
    if (controller.text.isEmpty) return;
    items.add({
      "id": DateTime.now().millisecondsSinceEpoch,
      "name": controller.text
    });
    controller.clear();
    setState(() {});
  }

  void save() async {
    await storage.writeData(items);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Data saved to local storage!"),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lab 9.2 - Local Storage"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                labelText: "Item Name",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.add_shopping_cart),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: addItem,
                    icon: const Icon(Icons.add),
                    label: const Text("Add to List"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigoAccent,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: save,
                    icon: const Icon(Icons.save),
                    label: const Text("Save File"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(height: 30),
            const Text(
              "Current Items (Unsaved changes marked in list):",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.indigo),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: items.isEmpty
                  ? const Center(child: Text("No items found. Add some!"))
                  : ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (_, i) => Card(
                        margin: const EdgeInsets.only(bottom: 8),
                        child: ListTile(
                          title: Text(items[i]['name']),
                          leading: CircleAvatar(
                            backgroundColor: Colors.indigo.withOpacity(0.1),
                            child: Text("${i + 1}"),
                          ),
                        ),
                      ),
                    ),
            )
          ],
        ),
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
