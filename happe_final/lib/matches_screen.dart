import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:happe_final/chat_screen.dart';
import 'user.dart' as model; // Your User model // Ensure this is correctly imported

class MatchesScreen extends StatefulWidget {
  @override
  _MatchesScreenState createState() => _MatchesScreenState();
}

class _MatchesScreenState extends State {
  model.User? user;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchCurrentUser();
  }

// Fetch the currently logged-in user's details from Firestore
  void fetchCurrentUser() async {
    var currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      try {
        var documentSnapshot = await FirebaseFirestore.instance
            .collection('users')
            .doc(currentUser.uid)
            .get();
        if (documentSnapshot.exists) {
          setState(() {
            user = model.User.fromFirestore({
              ...documentSnapshot.data() as Map<String, dynamic>,
              'id': currentUser.uid // Passing UID as ID for simplicity
            });
            isLoading = false;
          });
        } else {
          print("No user found with id ${currentUser.uid}");
          setState(() {
            isLoading = false;
          });
        }
      } catch (e) {
        print("Error fetching user data: $e");
        setState(() {
          isLoading = false;
        });
      }
    } else {
      print("No user is currently logged in");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Profile"),
      ),
      body: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : user != null
                ? ListTile(
                    title: Text(user!.name, style: TextStyle(fontSize: 20)),
                    trailing: IconButton(
                      icon: Icon(Icons.message),
                      onPressed: () {
// Navigate to ChatPage when the icon is pressed
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChatPage(user: user!)),
                        );
                      },
                    ),
                  )
                : Text("No user data available"),
      ),
    );
  }
}
