part of 'counter_bloc.dart';

@immutable
sealed class CounterEvent {}

class NumberIncreaseEvent extends CounterEvent {}

class NumberDecreaseEvent extends CounterEvent {}
