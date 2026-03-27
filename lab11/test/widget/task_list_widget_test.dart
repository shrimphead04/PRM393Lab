import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab11/screens/task_list_screen.dart';

void main() {
  testWidgets('TaskListScreen should display empty message when no tasks', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: TaskListScreen()));
    expect(find.text('No tasks yet. Add one!'), findsOneWidget);
  });

  testWidgets('Adding a task should update the list', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: TaskListScreen()));

    await tester.enterText(find.byType(TextField), 'New Task');
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('New Task'), findsOneWidget);
    expect(find.text('No tasks yet. Add one!'), findsNothing);
  });

  testWidgets('Adding multiple tasks should show all tasks in list', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: TaskListScreen()));

    // Add first task
    await tester.enterText(find.byType(TextField), 'Task 1');
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Add second task
    await tester.enterText(find.byType(TextField), 'Task 2');
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('Task 1'), findsOneWidget);
    expect(find.text('Task 2'), findsOneWidget);
  });
}
