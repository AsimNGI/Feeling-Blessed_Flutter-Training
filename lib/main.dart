import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_training/bloc/exp1/meta_cubit.dart';
import 'package:flutter_training/bloc/exp1/update_ui_cubit.dart';
import 'package:flutter_training/theme/app_theme.dart';
import 'package:flutter_training/utils/app_constant.dart';
import 'package:flutter_training/utils/app_router.dart';

import 'bloc/exp2/bloc/example_bloc.dart';

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
        return MultiBlocProvider(
          providers: [
            BlocProvider<UpdateUiCubit>(create: (context) => UpdateUiCubit()),
            BlocProvider<MetaCubit>(create: (context) => MetaCubit()),
            BlocProvider<ExampleBloc>(create: (context) => ExampleBloc()),
          ],
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Feeling Blessed',
            theme: AppTheme.theme,
            routerConfig: AppRouter.appRouter,
          ),
        );
      },
    );
  }
}
