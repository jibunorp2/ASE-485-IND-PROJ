import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:happe_final/picture_page.dart'; // Adjust the import path according to your project structure
import 'package:happe_final/login_page.dart';

void main() {
  testWidgets('UserPicturesPage displays and interacts as expected', (WidgetTester tester) async {

    await tester.pumpWidget(MaterialApp(home: UserPicturesPage()));

    expect(find.byIcon(Icons.add_photo_alternate), findsNWidgets(5));

    await tester.tap(find.text('Finish'));
    await tester.pumpAndSettle(); 

    expect(find.byType(LoginPage), findsOneWidget);
  });
}
