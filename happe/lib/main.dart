import 'package:flutter/material.dart';
import 'package:happe/blocs/swipe/swipe_bloc.dart';
import 'package:happe/screens/home/home_screen.dart';
import 'package:happe/screens/user/user_screen.dart';

import 'models/models.dart'; // Import the HomeScreen widget if it's in a separate file
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => SwipeBloc()..add(LoadUsersEvent(users: User.users)))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(), // Use the HomeScreen widget as the home route
      ),
    );
  }
}
