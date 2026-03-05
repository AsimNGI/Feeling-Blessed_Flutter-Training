import 'package:flutter_training/model/album_items.dart';
import 'package:flutter_training/utils/app_constant.dart';
import 'package:flutter_training/utils/app_strings.dart';

class AlbumDataSource {
  static const String _base = AppConstant.placeholderImageBase;

  static List<AlbumItems> get albums => [
    AlbumItems('$_base/id/10/200', AppStrings.mountainView, '1'),
    AlbumItems('$_base/id/11/200', AppStrings.lushForest, '2'),
    AlbumItems('$_base/id/12/200', AppStrings.oceanWaves, '3'),
    AlbumItems('$_base/id/13/200', AppStrings.desertDunes, '4'),
    AlbumItems('$_base/id/14/200', AppStrings.cityLights, '5'),
    AlbumItems('$_base/id/15/200', AppStrings.autumnLeaves, '6'),
    AlbumItems('$_base/id/16/200', AppStrings.snowyPeaks, '7'),
    AlbumItems('$_base/id/17/200', AppStrings.grassyFields, '8'),
    AlbumItems('$_base/id/18/200', AppStrings.deepBlue, '9'),
    AlbumItems('$_base/id/19/200', AppStrings.starryNight, '10'),
    AlbumItems('$_base/id/20/200', AppStrings.goldenSunset, '11'),
    AlbumItems('$_base/id/21/200', AppStrings.mistyRiver, '12'),
    AlbumItems('$_base/id/22/200', AppStrings.quietLake, '13'),
    AlbumItems('$_base/id/23/200', AppStrings.canyonRocks, '14'),
    AlbumItems('$_base/id/24/200', AppStrings.greenValley, '15'),
    AlbumItems('$_base/id/25/200', AppStrings.palmBeach, '16'),
  ];
}
