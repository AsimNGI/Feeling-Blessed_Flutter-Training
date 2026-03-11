import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_training/theme/app_theme.dart';
import 'package:flutter_training/utils/app_constant.dart';
import 'package:flutter_training/utils/app_routes.dart';

import 'cubit/gallery_cubit.dart';

void main() {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => GalleryCubit()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(
          AppConstant.designWidth,
          AppConstant.designHeight,
        ),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Feeling Blessed',
            theme: AppTheme.theme,
            routerConfig: AppRoutes().appRoutes,
          );
        },
      ),
    );
  }
}
