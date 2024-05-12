part of 'appbar_bloc.dart';

abstract class AppBarEvent {}

class FocusChangedEvent extends AppBarEvent {
  final bool hasFocus;

  FocusChangedEvent(this.hasFocus);
}
