import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab11/main.dart';
import 'package:lab11/screens/task_list_screen.dart';
import 'package:lab11/screens/task_detail_screen.dart';

void main() {
  testWidgets('Integration Test: Add and Edit a Task', (WidgetTester tester) async {
    // Start the app
    await tester.pumpWidget(const TasklyApp());

    // 1. Add a new task
    final textField = find.byType(TextField);
    final addButton = find.byIcon(Icons.add);

    await tester.enterText(textField, 'Initial Task');
    await tester.tap(addButton);
    await tester.pump();

    expect(find.text('Initial Task'), findsOneWidget);

    // 2. Navigate to details
    await tester.tap(find.text('Initial Task'));
    await tester.pumpAndSettle();

    expect(find.byType(TaskDetailScreen), findsOneWidget);

    // 3. Edit the task
    final detailField = find.byKey(const Key("detailTitleField"));
    await tester.enterText(detailField, 'Updated Task');
    await tester.tap(find.byIcon(Icons.save));
    await tester.pumpAndSettle();

    // 4. Verify update in TaskListScreen
    expect(find.byType(TaskListScreen), findsOneWidget);
    expect(find.text('Updated Task'), findsOneWidget);
    expect(find.text('Initial Task'), findsNothing);
  });
}
