import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_training/bloc/home/home_bloc.dart';
import 'package:flutter_training/core/env/app_env.dart';
import 'package:flutter_training/core/network/dio_client.dart';
import 'package:flutter_training/theme/app_theme.dart';
import 'package:flutter_training/utils/app_constant.dart';
import 'package:flutter_training/utils/app_routes.dart';

import 'cubit/gallery_cubit.dart';

Future<void> main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await loadAppEnv();
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
        designSize: const Size(
          AppConstant.designWidth,
          AppConstant.designHeight,
        ),
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
