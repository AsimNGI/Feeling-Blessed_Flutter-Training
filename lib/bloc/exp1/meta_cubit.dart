import 'package:flutter_bloc/flutter_bloc.dart';

class MetaCubit extends Cubit<MetaState> {
  MetaCubit() : super(MetaInitialState());

  fetchMeta() async {
    emit(MetaLoadingState());
    try {
      await Future.delayed(const Duration(seconds: 3));
      emit(MetaLoadedState(bannerImage: 'https://picsum.photos/200/300'));
    } catch (e) {
      emit(MetaErrorState(error: e.toString()));
    }
  }

  fetchUserData() async {
    emit(UserLoadingState2());
    try {
      await Future.delayed(const Duration(seconds: 3));
      emit(UserLoadedState2(userName: 'Asim'));
    } catch (e) {
      emit(UserErrorState2(error: e.toString()));
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

class UserLoadingState2 extends MetaState {}

class UserLoadedState2 extends MetaState {
  final String userName;
  UserLoadedState2({required this.userName});
}

class UserErrorState2 extends MetaState {
  final String error;
  UserErrorState2({required this.error});
}
