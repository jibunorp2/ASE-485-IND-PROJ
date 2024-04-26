import 'package:flutter/material.dart';
import 'home_page.dart';
import 'register_page.dart';  // Make sure this is correctly importing your HomePage

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State
{
final _formKey = GlobalKey<FormState>();
String _email = '';
String _password = '';

void _login() {
if (_formKey.currentState!.validate()) {
_formKey.currentState!.save();
// Perform the login operation. Here, you might check credentials or similar.
// If successful:
Navigator.pushReplacement(
context,
MaterialPageRoute(builder: (context) => HomePage()),
);
}
}

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: Text("Login"),
backgroundColor: Colors.orange, // You can adjust the color to fit your theme
),
body: Padding(
padding: const EdgeInsets.all(16.0),
child: Form(
key: _formKey,
child: Column(
crossAxisAlignment: CrossAxisAlignment.stretch,
children: <Widget>[
TextFormField(
decoration: InputDecoration(
labelText: 'Email',
border: OutlineInputBorder(),
prefixIcon: Icon(Icons.email),
),
validator: (value) {
if (value == null || value.isEmpty) {
return 'Please enter your email';
}
if (!value.contains('@')) {
return 'Please enter a valid email address';
}
return null;
},
onSaved: (value) => _email = value!,
),
SizedBox(height: 20),
TextFormField(
obscureText: true,
decoration: InputDecoration(
labelText: 'Password',
border: OutlineInputBorder(),
prefixIcon: Icon(Icons.lock),
),
validator: (value) {
if (value == null || value.isEmpty) {
return 'Please enter your password';
}
return null;
},
onSaved: (value) => _password = value!,
),
SizedBox(height: 20),
ElevatedButton(
onPressed: _login,
child: Text('Login'),
),
TextButton(
onPressed: () {
// Navigate to registration page
// Assuming RegisterPage exists and is imported
Navigator.push(
context,
MaterialPageRoute(builder: (context) => RegisterPage()),
);
},
child: Text("Don't have an account? Register Here!"),
),
],
),
),
),
);
}
}