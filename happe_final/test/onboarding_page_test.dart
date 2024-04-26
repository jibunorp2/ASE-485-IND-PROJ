import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:happe_final/onboarding_page.dart';  // Adjust the import path according to your project structure
import 'package:happe_final/user_setup_page.dart';

void main() {
  testWidgets('Next Steps button navigates to the UserSetupPage', (WidgetTester tester) async {
    // Create a MaterialApp to set up navigation
    await tester.pumpWidget(MaterialApp(
      home: OnboardingPage(),
      routes: {
        '/userSetupPage': (context) => UserSetupPage(),
      },
    ));

    // Wait for the progress simulation to complete (simulate 10 seconds passing)
    await tester.pump(Duration(seconds: 10));
    await tester.pumpAndSettle();

    // Check if the progress bar is full or nearly full (depending on your implementation)
    expect((tester.widget(find.byType(LinearProgressIndicator)) as LinearProgressIndicator).value, closeTo(1.0, 0.1));

    // Find the Next Steps button and tap it
    await tester.tap(find.text('Next Steps'));
    await tester.pumpAndSettle();  // Wait for the navigation animation to finish

    // Check if navigating to the UserSetupPage occurs
    expect(find.byType(UserSetupPage), findsOneWidget);
  });
}
