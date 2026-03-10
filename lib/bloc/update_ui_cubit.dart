import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateUiCubit extends Cubit<Color> {
  Meta? meta;
  UpdateUiCubit() : super(Colors.red);

  void updateColor(String name) {
    print('name: $name');
    // updateColor(Colors.blue);
    if (name == 'talha') {
      emit(Colors.green);
    } else if (name == 'asim') {
      emit(Colors.yellow);
    }
  }

  void updateMeta() {
    final apiMetaResponse = Meta(bannerImage: 'https://picsum.photos/200/300');
    meta = apiMetaResponse;
    emit(Colors.red);
  }
}

class Meta {
  final String bannerImage;

  Meta({required this.bannerImage});
}

// Cubit
// 1 time function called
// 1 time state changed
// 2nd time function called
// 2nd time state changed

// Bloc
