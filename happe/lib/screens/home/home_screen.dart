import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happe/widgets/widgets.dart';

import 'package:happe/models/models.dart';

import '../../blocs/swipe/swipe_bloc.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => HomeScreen(),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: BlocBuilder<SwipeBloc, SwipeState>(
        builder: (context, state) {
          if (state is SwipeLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is SwipeLoaded) {
            return Column(
              children: [
                InkWell(
                  onDoubleTap: () {
                    Navigator.pushNamed(context, '/users',
                        arguments: state.users[0]);
                  },
                  child: Draggable(
                    child: UserCard(user: state.users[0]),
                    feedback: UserCard(user: state.users[0]),
                    childWhenDragging: UserCard(user: state.users[1]),
                    onDragEnd: (drag) {
                      if (drag.velocity.pixelsPerSecond.dx < 0) {
                        context.read<SwipeBloc>()
                          ..add(SwipeLeftEvent(user: state.users[0]));
                        print('Swiped Left');
                      } else {
                        context.read<SwipeBloc>()
                          ..add(SwipeRightEvent(user: state.users[0]));
                        print('Swiped Right');
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 60,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          context.read<SwipeBloc>()
                            ..add(SwipeLeftEvent(user: state.users[0]));
                          print('Swiped Left');
                        },
                        child: ChoiceButton(
                          width: 60,
                          height: 60,
                          size: 25,
                          hasGradient: false,
                          color: Theme.of(context).colorScheme.primary,
                          icon: Icons.clear_sharp,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          context.read<SwipeBloc>()
                            ..add(SwipeRightEvent(user: state.users[0]));
                          print('Swiped Right');
                        },
                        child: ChoiceButton(
                          width: 60,
                          height: 60,
                          size: 30,
                          hasGradient: true,
                          color: Theme.of(context).colorScheme.secondary,
                          icon: Icons.favorite_border_sharp,
                        ),
                      ),
                      ChoiceButton(
                        width: 60,
                        height: 60,
                        size: 25,
                        hasGradient: false,
                        color: Theme.of(context).colorScheme.primary,
                        icon: Icons.watch_later,
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return Text('Something went wrong');
          }
        },
      ),
    );
  }
}
