import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State {
  String userEmail = '';
  String userName = '';
  String userAge = "0"; // Assuming age is stored as a string
  String jobTitle = '';
  String bio = '';
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

// Fetch user data from Firebase Authentication and Firestore
  void fetchUserData() {
    var user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      userEmail = user.email ?? "No email available";

      FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get()
          .then((document) {
        if (document.exists) {
          setState(() {
            userName = document.data()?['name'] ?? "No name available";
            userAge = document.data()?['age'].toString() ??
                "0"; // Ensure age is treated as a string
            jobTitle = document.data()?['jobTitle'] ?? "No job title available";
            bio = document.data()?['bio'] ?? "No bio available";
            isLoading = false;
          });
        } else {
          setState(() {
            isLoading = false;
          });
        }
      }).catchError((error) {
        print("Error fetching user details: $error");
        setState(() {
          isLoading = false;
        });
      });
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: Colors.deepPurple, // Enhanced AppBar color
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              // Added for better handling of overflow
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    CircleAvatar(
                      radius: 50, // Added avatar
                      backgroundImage:
                          NetworkImage("https://via.placeholder.com/150"),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Email: $userEmail",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Name: $userName",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Age: $userAge",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Job Title: $jobTitle",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "Bio: $bio",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
    );
  }
}
