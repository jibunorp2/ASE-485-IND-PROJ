import 'package:flutter/material.dart';
import 'user.dart';  // Ensure this is correctly imported

class ChatPage extends StatelessWidget {
  final User user;

  ChatPage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with ${user.name}'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Placeholder(),  // This would be your chat messages list
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Send a message...',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    // Send message logic
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
