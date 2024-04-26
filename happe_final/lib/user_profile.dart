import 'package:flutter/material.dart';
import 'user.dart';  // Ensure the User class is available

class UserProfilePage extends StatelessWidget {
  final User user;

  UserProfilePage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(user.imageUrls.first, fit: BoxFit.cover, height: 300),
            SizedBox(height: 20),
            Text("Name: ${user.name}", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text("Age: ${user.age}", style: TextStyle(fontSize: 20)),
            Text("Job Title: ${user.jobTitle}", style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text("Interests:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Wrap(
              spacing: 8,
              children: user.interests.map((interest) => Chip(label: Text(interest))).toList(),
            ),
            SizedBox(height: 10),
            Text("Bio:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text(user.bio, style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
