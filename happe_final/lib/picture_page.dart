import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'login_page.dart';

class UserPicturesPage extends StatefulWidget {
  final Map<String, dynamic> userData;

  UserPicturesPage({required this.userData});

  @override
  _UserPicturesPageState createState() => _UserPicturesPageState();
}

class _UserPicturesPageState extends State<UserPicturesPage> {
  List<File> _images = [];
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload Your Pictures"),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Upload up to 5 pictures:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 10,
              children: List.generate(5, (index) => _buildImageSlot(index)),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _uploadAndFinishProfile,
              child: Text('Finish'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageSlot(int index) {
    return GestureDetector(
      onTap: () => _pickImage(index),
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          border: Border.all(color: Colors.orange),
          borderRadius: BorderRadius.circular(8),
        ),
        child: _images.length > index ? Image.file(_images[index], fit: BoxFit.cover) : Icon(Icons.add_photo_alternate, color: Colors.orange),
      ),
    );
  }

  Future<void> _pickImage(int index) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        if (index >= _images.length) {
          _images.add(File(pickedFile.path));
        } else {
          _images[index] = File(pickedFile.path);
        }
      });
    }
  }

  void _uploadAndFinishProfile() async {
    if (_images.isEmpty) {
      print('No images selected');
      return;
    }

    try {
      List<String> imageUrls = [];
      for (File image in _images) {
        String url = await _uploadImageAndGetUrl(image);
        imageUrls.add(url);
      }

      // Combine data and image URLs
      widget.userData.addAll({'imageUrls': imageUrls});

      // Upload complete user data
      FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .set(widget.userData);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage())
      );
    } catch (e) {
      print('Error completing profile: $e');
      // Consider showing an error message to the user
    }
  }

  Future<String> _uploadImageAndGetUrl(File image) async {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    String fileName = DateTime.now().millisecondsSinceEpoch.toString() + '.jpg';
    TaskSnapshot snapshot = await FirebaseStorage.instance
      .ref('user_images/$userId/$fileName')
      .putFile(image);

    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }
}
