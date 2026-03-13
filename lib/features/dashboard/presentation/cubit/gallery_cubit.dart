import 'package:flutter_bloc/flutter_bloc.dart';

import 'gallery_state.dart';

class GalleryCubit extends Cubit<GalleryState> {
  GalleryCubit() : super(const GalleryState());

  void toggleView() {
    emit(state.copyWith(isGridView: !state.isGridView));
  }

  void setGridView(bool value) {
    if (state.isGridView != value) {
      emit(state.copyWith(isGridView: value));
    }
  }
}
