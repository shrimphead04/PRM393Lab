import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab6/main.dart';

void main() {
  testWidgets('Movie Browser UI test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ResponsiveMovieApp());

    // Verify that the title is present
    expect(find.text('Find a Movie'), findsOneWidget);

    // Verify that the search bar is present
    expect(find.byType(TextField), findsOneWidget);

    // Verify that some initial genres are shown
    expect(find.text('Action'), findsOneWidget);
    expect(find.text('Drama'), findsOneWidget);
  });
}
