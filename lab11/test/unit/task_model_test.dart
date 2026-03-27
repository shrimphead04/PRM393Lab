import 'package:flutter_test/flutter_test.dart';
import 'package:lab11/models/task.dart';

void main() {
  group('Task Model Tests', () {
    test('Task should be initialized with correct title and default completed status', () {
      final task = Task(title: 'Test Task');
      expect(task.title, 'Test Task');
      expect(task.completed, false);
    });

    test('toggle() should switch completed status', () {
      final task = Task(title: 'Test Task');
      task.toggle();
      expect(task.completed, true);
      task.toggle();
      expect(task.completed, false);
    });
  });
}
