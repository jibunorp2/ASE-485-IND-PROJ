import 'package:flutter/material.dart';
import 'package:happe_final/chat_screen.dart';
import 'user.dart';  

class MatchesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Matches"),
      ),
      body: ListView.builder(
        itemCount: User.users.length,
        itemBuilder: (context, index) {
          User user = User.users[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(user.imageUrls.first), 
            ),
            title: Text(user.name),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.message),
                  onPressed: () {
                    // Navigate to ChatPage
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChatPage(user: user)),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.person),
                  onPressed: () {
                    print('View profile of ${user.name}');
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
