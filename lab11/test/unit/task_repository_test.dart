import 'package:flutter_test/flutter_test.dart';
import 'package:lab11/models/task.dart';
import 'package:lab11/repositories/task_repository.dart';

void main() {
  group('TaskRepository Tests', () {
    late TaskRepository repository;

    setUp(() {
      repository = TaskRepository();
    });

    test('Initial tasks list should be empty', () {
      expect(repository.getTasks(), isEmpty);
    });

    test('addTask should add a task to the repository', () {
      final task = Task(title: 'New Task');
      repository.addTask(task);
      expect(repository.getTasks().length, 1);
      expect(repository.getTasks().first.title, 'New Task');
    });

    test('deleteTask should remove the task from the repository', () {
      final task = Task(title: 'Task to delete');
      repository.addTask(task);
      expect(repository.getTasks().length, 1);
      repository.deleteTask(task);
      expect(repository.getTasks(), isEmpty);
    });

    test('updateTask should update the task at the given index', () {
      repository.addTask(Task(title: 'Original Task'));
      final updatedTask = Task(title: 'Updated Task');
      repository.updateTask(0, updatedTask);
      expect(repository.getTasks()[0].title, 'Updated Task');
    });
  });
}
