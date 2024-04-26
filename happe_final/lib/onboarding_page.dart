import 'package:flutter/material.dart';
import 'user_setup_page.dart'; // Make sure this import is correct

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State
{
double _progressValue = 0.0;

@override
void initState() {
super.initState();
_updateProgress();
}

void _updateProgress() {
// Simulate a time-consuming task (like fetching data)
Future.delayed(Duration(seconds: 2), () {
setState(() {
_progressValue += 0.2;
if (_progressValue < 1.0) {
_updateProgress(); // Recursive call to simulate progress
}
});
});
}

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: Text("Welcome to HAPPE"),
),
body: Padding(
padding: const EdgeInsets.all(20.0),
child: Column(
crossAxisAlignment: CrossAxisAlignment.stretch,
children: <Widget>[
Expanded(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Text(
"Welcome to HAPPE",
style: TextStyle(
fontSize: 24,
fontWeight: FontWeight.bold,
),
),
SizedBox(height: 10),
Text(
"We hope you enjoy this application and find what you're looking for.",
style: TextStyle(
fontSize: 16,
),
textAlign: TextAlign.center,
),
SizedBox(height: 30),
LinearProgressIndicator(
value: _progressValue,
backgroundColor: Colors.grey[200],
valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
),
],
),
),
ElevatedButton(
onPressed: () {
// Navigate to UserSetupPage
Navigator.push(
context,
MaterialPageRoute(builder: (context) => UserSetupPage()),
);
},
child: Text('Next Steps'),
style: ElevatedButton.styleFrom(
foregroundColor: Colors.white, backgroundColor: Colors.orange, // Text color
),
),
],
),
),
);
}
}