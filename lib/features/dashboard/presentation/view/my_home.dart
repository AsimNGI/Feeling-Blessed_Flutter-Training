import 'package:flutter/material.dart';
import 'package:flutter_training/core/constants/app_colors.dart';
import 'package:flutter_training/core/constants/app_images_url.dart';
import 'package:flutter_training/core/constants/app_strings.dart';
import 'package:flutter_training/features/dashboard/domain/entity/response/album_items.dart';
import 'package:flutter_training/features/dashboard/domain/entity/response/organization.dart';
import 'package:flutter_training/features/dashboard/presentation/view/gallery_screen.dart';
import 'package:flutter_training/features/dashboard/presentation/view/org_detail_screen.dart';
import 'package:flutter_training/features/home/presentation/view/home_screen_mobile_view.dart';

class MyHomePage extends StatefulWidget {
  final List<AlbumItems> albums;
  const MyHomePage({super.key, required this.albums});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static const List<BottomNavigationBarItem> _navItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      activeIcon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.photo_album_outlined),
      activeIcon: Icon(Icons.photo_album),
      label: 'Gallery',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.volunteer_activism_outlined),
      activeIcon: Icon(Icons.volunteer_activism),
      label: 'Cause',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person_outline),
      activeIcon: Icon(Icons.person),
      label: 'Profile',
    ),
  ];

  List<Widget> get _screens => [
    KeepAliveWrapper(child: const HomeScreenMobileView()),
    KeepAliveWrapper(child: MyGallery(albums: widget.albums)),
    KeepAliveWrapper(
      child: OrgDetailScreen(
        org: Organization(
          name: AppStrings.sampleOrgName,
          location: AppStrings.sampleOrgLocation,
          website: AppStrings.sampleOrgWebsite,
          phone: AppStrings.sampleOrgPhone,
          email: AppStrings.sampleOrgEmail,
          etnNumber: AppStrings.sampleOrgEtnNumber,
          coverImagePath: AppImagesUrl.coverImagePlaceholder,
          logoPath: AppImagesUrl.logoEdhi,
        ),
      ),
    ),
    KeepAliveWrapper(child: Text(AppStrings.profile)),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IndexedStack(index: _selectedIndex, children: _screens),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: (index) => setState(() => _selectedIndex = index),
          items: _navItems,
          backgroundColor: AppColors.navBarBackground,
          selectedItemColor: AppColors.textPrimary,
          unselectedItemColor: AppColors.textSecondary,
        ),
      ),
    );
  }
}

class KeepAliveWrapper extends StatefulWidget {
  final Widget child;

  const KeepAliveWrapper({super.key, required this.child});

  @override
  State<KeepAliveWrapper> createState() => _KeepAliveWrapperState();
}

class _KeepAliveWrapperState extends State<KeepAliveWrapper> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  bool get wantKeepAlive => true;
}
