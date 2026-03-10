import 'package:flutter_bloc/flutter_bloc.dart';

class MetaCubit extends Cubit<MetaState> {
  MetaCubit() : super(MetaInitialState());

  fetchMeta() async {
    emit(MetaLoadingState());
    try {
      await Future.delayed(const Duration(seconds: 3));
      emit(MetaLoadedState(bannerImage: 'https://picsum.photos/id/10/200/300'));
    } catch (e) {
      emit(MetaErrorState(error: e.toString()));
    }
  }
}

class MetaState {}

class MetaInitialState extends MetaState {}

class MetaLoadingState extends MetaState {}

class MetaLoadedState extends MetaState {
  final String bannerImage;
  MetaLoadedState({required this.bannerImage});
}

class MetaErrorState extends MetaState {
  final String error;
  MetaErrorState({required this.error});
}
