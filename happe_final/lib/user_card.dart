import 'package:flutter/material.dart';
import 'user.dart';  // Ensure this is correctly imported
import 'dart:math';

class UserCard extends StatefulWidget {
  @override
  _UserCardState createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  int currentIndex = 0;
  late String mainImageUrl; // To hold the current main image URL

  @override
  void initState() {
    super.initState();
    if (User.users.isNotEmpty) {
      mainImageUrl = User.users[currentIndex].imageUrls.first; // Set initial main image
    }
  }

  void nextCard() {
    setState(() {
      currentIndex = (currentIndex + 1) % User.users.length;
      mainImageUrl = User.users[currentIndex].imageUrls.first; // Update main image URL
    });
  }

  void updateMainImage(String newImageUrl) {
    setState(() {
      mainImageUrl = newImageUrl; // Update main image URL with animation
    });
  }

  @override
  Widget build(BuildContext context) {
    if (User.users.isEmpty) return Text("No users left!");

    var user = User.users[currentIndex];
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(child: child, opacity: animation);
          },
          child: Image.network(
            mainImageUrl,
            key: ValueKey<String>(mainImageUrl),
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        Positioned(
          bottom: 90,
          left: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text('${user.name}, ${user.age} - ${user.jobTitle}',
              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Positioned(
          left: 20,
          top: 20,
          child: InkWell(
            onTap: nextCard,
            child: Icon(Icons.clear_sharp, color: Colors.red, size: 40),
          ),
        ),
        Positioned(
          right: 20,
          top: 20,
          child: InkWell(
            onTap: nextCard,
            child: Icon(Icons.favorite, color: Colors.green, size: 40),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: user.imageUrls.map((url) => GestureDetector(
              onTap: () => updateMainImage(url),
              child: Container(
                width: 50,
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(url),
                    fit: BoxFit.cover
                  ),
                  border: Border.all(
                    color: mainImageUrl == url ? Colors.black : Colors.transparent, // Highlight the selected image
                    width: 2,
                  ),
                ),
              ),
            )).toList(),
          ),
        ),
      ],
    );
  }
}
