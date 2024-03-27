part of 'counter_bloc.dart';

@immutable
sealed class CounterState {}

final class CounterInitial extends CounterState {}

class UpdateState extends CounterState {
  final int counter;
  UpdateState(this.counter);
}

class LoadingState extends CounterState {}
