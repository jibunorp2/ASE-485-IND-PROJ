import 'package:flutter/material.dart';

class ChoiceButton extends StatelessWidget {
  final double width;
  final double height;
  final double size;
  final Color color;
  final bool hasGradient;
  final IconData icon;

  const ChoiceButton(
      {super.key,
      this.width = 60,
      this.height = 60,
      this.size = 25,
      required this.color,
      this.hasGradient = false,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        gradient: hasGradient
            ? LinearGradient(
                colors: [
                  Theme.of(context).canvasColor,
                  Theme.of(context).primaryColor,
                ],
              )
            : LinearGradient(
                colors: [
                  Colors.white,
                  Colors.white,
                ],
              ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 4,
            blurRadius: 4,
            offset: Offset(3, 3),
          )
        ],
      ),
      child: Icon(
        icon,
        color: color,
        size: size,
      ),
    );
  }
}
