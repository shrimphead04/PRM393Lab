import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab11/screens/task_list_screen.dart';
import 'package:lab11/screens/task_detail_screen.dart';
import 'package:lab11/repositories/task_repository.dart';
import 'package:lab11/models/task.dart';

void main() {
  testWidgets('Navigation to TaskDetailScreen and back', (WidgetTester tester) async {
    final repository = TaskRepository();
    repository.addTask(Task(title: 'Navigate Me'));

    await tester.pumpWidget(MaterialApp(home: TaskListScreen(repository: repository)));

    // Find and tap the task to navigate
    await tester.tap(find.text('Navigate Me'));
    await tester.pumpAndSettle();

    // Check if TaskDetailScreen is displayed
    expect(find.byType(TaskDetailScreen), findsOneWidget);
    expect(find.text('Task Detail'), findsOneWidget);

    // Tap the back button (or save button which also pops)
    await tester.tap(find.byIcon(Icons.save));
    await tester.pumpAndSettle();

    // Check if we are back at TaskListScreen
    expect(find.byType(TaskListScreen), findsOneWidget);
  });
}
