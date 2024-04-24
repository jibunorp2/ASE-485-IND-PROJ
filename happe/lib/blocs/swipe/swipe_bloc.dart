import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/models.dart';

part 'swipe_event.dart';
part 'swipe_state.dart';

class SwipeBloc extends Bloc<SwipeEvent, SwipeState> {
  SwipeBloc() : super(SwipeLoading()) {
    // Registering event handlers using the `on<T>` method
    on<LoadUsersEvent>(_onLoadUsersEvent);
    on<SwipeLeftEvent>(_onSwipeLeftEvent);
    on<SwipeRightEvent>(_onSwipeRightEvent);
  }

  void _onLoadUsersEvent(
    LoadUsersEvent event,
    Emitter<SwipeState> emit,
  ) {
    emit(SwipeLoaded(users: event.users));
  }

  void _onSwipeLeftEvent(
    SwipeLeftEvent event,
    Emitter<SwipeState> emit,
  ) {
    final currentState = state;
    if (currentState is SwipeLoaded) {
      try {
        var newUsers = List<User>.from(currentState.users)..remove(event.user);
        emit(SwipeLoaded(users: newUsers));
      } catch (_) {
        // Optionally, handle any errors here
        emit(SwipeError()); // You might need to implement this state
      }
    }
  }

  void _onSwipeRightEvent(
    SwipeRightEvent event,
    Emitter<SwipeState> emit,
  ) {
    final currentState = state;
    if (currentState is SwipeLoaded) {
      try {
        var newUsers = List<User>.from(currentState.users)..remove(event.user);
        emit(SwipeLoaded(users: newUsers));
      } catch (_) {
        // Optionally, handle any errors here
        emit(SwipeError()); // You might need to implement this state
      }
    }
  }
}
