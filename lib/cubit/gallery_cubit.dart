import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/constants/api_constants.dart';
import '../core/dio_client.dart';
import '../utils/app_logger.dart';
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
  Future<void> getMetaData() async {
    try {
      final response = await DioClient().getRequest(ApiConstants.metaData);
      if (response != null) {
        AppLogger.appLog("GET METADATA SUCCESS: ${response.data}");
      }
    } catch (e) {
      AppLogger.appLog("GET METADATA ERROR: $e");
    }
  }
}
