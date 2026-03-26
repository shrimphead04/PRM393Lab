import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab_8/main.dart';

void main() {
  testWidgets('Check if Nguyễn Hoàng Việt title exists', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the title with your name is present.
    expect(find.text('Nguyễn Hoàng Việt - Lab 8 API'), findsOneWidget);
  });
}
