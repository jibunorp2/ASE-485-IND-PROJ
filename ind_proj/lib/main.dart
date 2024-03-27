import 'package:flutter/material.dart';
import 'home.dart';
import 'login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedOpeningScreen(),
    );
  }
}

class AnimatedOpeningScreen extends StatefulWidget {
  @override
  _AnimatedOpeningScreenState createState() => _AnimatedOpeningScreenState();
}

class _AnimatedOpeningScreenState extends State<AnimatedOpeningScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
    _animationController.forward();

    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Navigate to the 'home.dart' page
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlutterLogo(
                size: 100.0,
              ),
              SizedBox(height: 20.0),
              Text(
                'Welcome to HAPEe',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
