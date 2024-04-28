import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'picture_page.dart'; // Assuming this is the path to the picture upload page

class UserSetupPage extends StatefulWidget {
  @override
  _UserSetupPageState createState() => _UserSetupPageState();
}

class _UserSetupPageState extends State<UserSetupPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _age = '';
  String _jobTitle = '';
  String _bio = '';
  List<String> _selectedInterests = [];
  final List<String> _interests = [
    'Music', 'Movies', 'Books', 'Sports', 'Tech', 'Travel', 'Cooking', 'Gaming'
  ];

  void _submitProfile() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      String userId = FirebaseAuth.instance.currentUser?.uid ?? '';

      FirebaseFirestore firestore = FirebaseFirestore.instance;
      Map<String, dynamic> userData = {
        'name': _name,
        'age': _age,
        'jobTitle': _jobTitle,
        'bio': _bio,
        'interests': _selectedInterests,
      };

      try {
        await firestore.collection('users').doc(userId).set(userData);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => UserPicturesPage(userData: userData)),
        );
      } catch (e) {
        print('Error saving profile: $e');
        // Consider showing an error message to the user
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setup Your Profile'),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onSaved: (value) => _name = value!,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Age',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.cake),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your age';
                  }
                  return null;
                },
                onSaved: (value) => _age = value!,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Job Title',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.work),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your job title';
                  }
                  return null;
                },
                onSaved: (value) => _jobTitle = value!,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Bio',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.book),
                ),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a bio';
                  }
                  return null;
                },
                onSaved: (value) => _bio = value!,
              ),
              Text('Select Interests', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Wrap(
                spacing: 10,
                children: _interests.map((interest) => FilterChip(
                  label: Text(interest),
                  selected: _selectedInterests.contains(interest),
                  onSelected: (bool selected) {
                    setState(() {
                      if (selected) {
                        _selectedInterests.add(interest);
                      } else {
                        _selectedInterests.removeWhere((String name) {
                          return name == interest;
                        });
                      }
                    });
                  },
                )).toList(),
              ),
              ElevatedButton(
                onPressed: _submitProfile,
                child: Text('Next Steps'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.orange,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
