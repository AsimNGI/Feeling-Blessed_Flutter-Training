part of 'example_bloc.dart';

@immutable
sealed class ExampleState {}

final class ExampleInitial extends ExampleState {}

final class ExampleLoadingState extends ExampleState {}

final class ExampleLoadedState extends ExampleState {}

final class ExampleErrorState extends ExampleState {
  final String error;
  ExampleErrorState({required this.error});
}
