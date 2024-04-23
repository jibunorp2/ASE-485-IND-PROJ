import 'package:flutter/material.dart';
import 'package:happe/screens/home/home_screen.dart'; // Import the HomeScreen widget if it's in a separate file

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(), // Use the HomeScreen widget as the home route
    );
  }
}
