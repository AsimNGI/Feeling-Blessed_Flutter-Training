import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_training/core/constants/app_colors.dart';
import 'package:flutter_training/core/constants/app_constant.dart';
import 'package:flutter_training/core/routing/app_screens_navigations.dart';
import 'package:flutter_training/features/dashboard/domain/entity/response/data_source.dart';

/// In-app splash matching the native splash (white background + centered logo).
/// Uses full-screen center so logo position matches native splash exactly.
/// Native splash is removed when this screen is first drawn for a seamless transition.
class SplashMobileView extends StatefulWidget {
  const SplashMobileView({super.key});

  @override
  State<SplashMobileView> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<SplashMobileView> {
  @override
  void initState() {
    super.initState();
    // Remove native splash once this screen is drawn (same look = seamless transition)
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FlutterNativeSplash.remove();
    });
    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      AppScreensNavigations.navigateToHome(context, AlbumDataSource.albums);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Full-screen center so logo position matches native splash exactly (same geometric center)
    return Container(
      color: AppColors.background,
      child: SizedBox.expand(
        child: Center(
          child: FlutterLogo(size: AppConstant.splashLogoSize),
        ),
      ),
    );
  }
}
