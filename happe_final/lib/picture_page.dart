import 'package:flutter/material.dart';// Import the home page
import 'login_page.dart';

class UserPicturesPage extends StatefulWidget {
  @override
  _UserPicturesPageState createState() => _UserPicturesPageState();
}

class _UserPicturesPageState extends State<UserPicturesPage> {
  List<ImageProvider> _images = [];

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
              onPressed: () {
                // Navigate to the HomePage after pictures are uploaded
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text('Finish'),

            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageSlot(int index) {
    return GestureDetector(
      onTap: () {
        // Handle image picking here
      },
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          border: Border.all(color: Colors.orange),
          borderRadius: BorderRadius.circular(8),
        ),
        child: _images.length > index ? Image(image: _images[index], fit: BoxFit.cover) : Icon(Icons.add_photo_alternate, color: Colors.orange),
      ),
    );
  }
}
