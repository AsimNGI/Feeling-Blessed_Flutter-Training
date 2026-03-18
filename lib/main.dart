import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_training/core/config/constants/app_colors.dart';
import 'package:flutter_training/core/config/constants/app_constant.dart';
import 'package:flutter_training/core/config/di/di.dart';
import 'package:flutter_training/core/config/global/env/app_env.dart';
import 'package:flutter_training/core/config/global/theme/app_theme.dart';
import 'package:flutter_training/core/config/routing/app_routes.dart';
import 'package:flutter_training/features/home/domain/use_cases/get_home_use_case.dart';
import 'package:flutter_training/features/home/presentation/bloc/home/home_bloc.dart';
import 'package:flutter_training/features/products/domain/use_cases/get_products_use_case.dart';

import 'features/dashboard/presentation/cubit/gallery_cubit.dart';
import 'features/products/presentation/bloc/products_bloc.dart';

Future<void> main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await AppInitializer().init();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: AppColors.navBarBackground,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor: Colors.transparent,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => GalleryCubit()),
        BlocProvider(create: (_) => HomeBloc(sl<GetHomeUseCase>())),
        BlocProvider(create: (_) => ProductsBloc(sl<GetProductsUseCase>()))
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
