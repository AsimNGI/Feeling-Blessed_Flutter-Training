import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_training/theme/app_theme.dart';
import 'package:flutter_training/ui/my_home.dart';
import 'package:flutter_training/utils/app_constant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(AppConstant.designWidth, AppConstant.designHeight),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Feeling Blessed',
          theme: AppTheme.theme,
          home: const MyHomePage(),
        );
      },
    );
  }
}
