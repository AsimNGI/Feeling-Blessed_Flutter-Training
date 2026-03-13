import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_training/core/config/di/di.dart';
import 'package:flutter_training/core/constants/app_constant.dart';
import 'package:flutter_training/core/data/network/dio_client.dart';
import 'package:flutter_training/core/global/env/app_env.dart';
import 'package:flutter_training/core/global/theme/app_theme.dart';
import 'package:flutter_training/core/routing/app_routes.dart';
import 'package:flutter_training/features/home/presentation/bloc/home/home_bloc.dart';

import 'features/dashboard/presentation/cubit/gallery_cubit.dart';

Future<void> main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await AppInitializer().init();
  DioClient().initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => GalleryCubit()),
        BlocProvider(create: (_) => HomeBloc()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(AppConstant.designWidth, AppConstant.designHeight),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: AppEnv.appName,
            theme: AppTheme.theme,
            routerConfig: AppRoutes().appRoutes,
          );
        },
      ),
    );
  }
}
