import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happe/models/models.dart';
import 'package:happe/models/user_model.dart';
import 'package:happe/widgets/choice_button.dart';

class UsersScreen extends StatelessWidget {
  static const String routeName = '/users';

  static Route route({required User user}) {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => UsersScreen(user: user),
    );
  }

  final User user;

  const UsersScreen({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 40.0),
                  child: Hero(
                    tag: 'user_image',
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        image: DecorationImage(
                          image: NetworkImage(user.imageUrls[0]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ChoiceButton(
                          color: Theme.of(context).colorScheme.error,
                          icon: Icons.clear_sharp,
                        ),
                        ChoiceButton(
                          height: 80,
                          width: 80,
                          size: 30,
                          color: Colors.black,
                          icon: Icons.favorite,
                          hasGradient: true,
                        ),
                        ChoiceButton(
                          color: Theme.of(context).primaryColor,
                          icon: Icons.watch_later,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 8.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${user.name}, ${user.age}',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                Text(
                  '${user.jobTitle}',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 15),
                Text(
                  'About',
                  style: Theme.of(context).textTheme.headlineSmall!,
                ),
                Text(
                  '${user.bio}',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(height: 2),
                ),
                SizedBox(height: 15),
                Text(
                  'Interests',
                  style: Theme.of(context).textTheme.headlineSmall!,
                ),
                Row(
                  children: user.interests
                      .map(
                        (interest) => Container(
                          padding: const EdgeInsets.all(5.0),
                          margin: const EdgeInsets.only(
                            top: 5.0,
                            right: 5.0,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            gradient: LinearGradient(
                              colors: [
                                Theme.of(context).primaryColor,
                                Theme.of(context).colorScheme.secondary,
                              ],
                            ),
                          ),
                          child: Text(
                            interest,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      )
                      .toList(),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
