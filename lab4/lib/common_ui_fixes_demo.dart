import 'package:flutter/material.dart';

/// Exercise 5 - Common UI Fixes
/// Demonstrating solutions to common UI errors:
/// 1. Fix ListView inside Column using Expanded
/// 2. Fix overflow using SingleChildScrollView
/// 3. Fix state update using setState()
/// 4. Fix DatePicker context errors
class CommonUIFixesDemo extends StatefulWidget {
  const CommonUIFixesDemo({super.key});

  @override
  State<CommonUIFixesDemo> createState() => _CommonUIFixesDemoState();
}

class _CommonUIFixesDemoState extends State<CommonUIFixesDemo> {
  // Sample movie list
  final List<String> movies = ['Movie A', 'Movie B', 'Movie C', 'Movie D'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 5 - Common UI Fixes'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Correct ListView inside Column using Expanded',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),

          // Fix 1: ListView inside Column using Expanded
          // This prevents "RenderBox was not laid out" error
          Expanded(
            child: ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.movie),
                  title: Text(movies[index]),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  // Fix 3: Using setState() to update UI when tapped
                  onTap: () {
                    setState(() {
                      // State update happens here
                    });
                    // Show feedback
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${movies[index]} tapped'),
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),

      // Fix 4: DatePicker called from valid widget tree context
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showDatePicker(context),
        child: const Icon(Icons.calendar_today),
      ),
    );
  }

  // Fix 4: Proper DatePicker implementation with valid BuildContext
  Future<void> _showDatePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null && mounted) {
      // Fix 3: Using setState() to update the UI
      setState(() {
        // You can store the picked date in a state variable if needed
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Selected: ${picked.day}/${picked.month}/${picked.year}',
            ),
          ),
        );
      }
    }
  }
}

// Example class demonstrating Fix 2: SingleChildScrollView for overflow prevention
class OverflowFixExample extends StatelessWidget {
  const OverflowFixExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Overflow Fix Example')),
      // Fix 2: Wrap content in SingleChildScrollView to prevent overflow
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Multiple widgets that might overflow on small screens
            for (int i = 0; i < 20; i++)
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Card(child: ListTile(title: Text('Item $i'))),
              ),
          ],
        ),
      ),
    );
  }
}
