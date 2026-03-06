import 'package:flutter/material.dart';
import 'package:flutter_training/data/data_source.dart';
import 'package:flutter_training/utils/app_screens_navigations.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({super.key});

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      AppScreensNavigations.navigateToHome(context, AlbumDataSource.albums);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Center(child: FlutterLogo(size: 100));
  }
}
