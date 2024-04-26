import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:happe_final/login_page.dart';

void main() {
  group('LoginPage Input Validation Tests', () {
    // Helper function to create the LoginPage widget wrapped with MaterialApp
    Widget createWidgetUnderTest() {
      return MaterialApp(
        home: LoginPage(),
      );
    }

    testWidgets('Shows error message if email and password are empty', (WidgetTester tester) async {
      // Arrange: Pump the LoginPage widget
      await tester.pumpWidget(createWidgetUnderTest());
      
      // Act: Tap the login button without entering any data
      await tester.tap(find.widgetWithText(ElevatedButton, 'Login'));
      await tester.pump();  // Trigger a frame

      // Assert: Check for error messages
      expect(find.text('Please enter your email'), findsOneWidget);
      expect(find.text('Please enter your password'), findsOneWidget);
    });
  });
}
