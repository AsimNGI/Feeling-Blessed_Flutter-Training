import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'example_event.dart';
part 'example_state.dart';

class ExampleBloc extends Bloc<ExampleEvent, ExampleState> {
  ExampleBloc() : super(ExampleInitial()) {
    on<ExampleEvent1>((event, emit) async {
      emit(ExampleLoadingState());
      try {
        print('ExampleLoadedState: ${event.name}');
        emit(ExampleLoadedState());
      } catch (e) {
        emit(ExampleErrorState(error: e.toString()));
      }
    });
  }
}
