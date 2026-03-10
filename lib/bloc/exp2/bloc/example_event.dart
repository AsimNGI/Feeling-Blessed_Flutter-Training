part of 'example_bloc.dart';

@immutable
sealed class ExampleEvent {}

class ExampleEvent1 extends ExampleEvent {
  final String name;
  ExampleEvent1({required this.name});
}
