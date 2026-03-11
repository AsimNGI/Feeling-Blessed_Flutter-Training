import 'package:animated_bubble_navigation_bar/animated_bubble_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_training/model/album_items.dart';
import 'package:flutter_training/model/organization.dart';
import 'package:flutter_training/ui/gallery_screen.dart';
import 'package:flutter_training/ui/org_detail_screen.dart';
import 'package:flutter_training/utils/app_colors.dart';
import 'package:flutter_training/utils/app_font_sizes.dart';
import 'package:flutter_training/utils/app_font_weights.dart';
import 'package:flutter_training/utils/app_images_url.dart';
import 'package:flutter_training/utils/app_padding.dart';
import 'package:flutter_training/utils/app_strings.dart';

class MyHomePage extends StatefulWidget {
  final List<AlbumItems> albums;
  const MyHomePage({super.key, required this.albums});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> get _screens => [
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

  final List<BubbleItem> _menuItems = const [
    BubbleItem(icon: Icons.photo_album_outlined, label: ''),
    BubbleItem(icon: Icons.volunteer_activism_outlined, label: ''),
    BubbleItem(icon: Icons.person_outline, label: ''),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: AnimatedBubbleNavBar(
          screens: _screens,
          menuItems: _menuItems,
          initialIndex: 0,

          bubbleDecoration: BubbleDecoration(
            backgroundColor: AppColors.navBarBackground,
            selectedBubbleBackgroundColor: AppColors.navBarSelectedBubble,
            unSelectedBubbleBackgroundColor: AppColors.navBarBackground,
            selectedBubbleLabelColor: AppColors.textPrimary,
            unSelectedBubbleLabelColor: AppColors.textOnDark,
            selectedBubbleIconColor: AppColors.textPrimary,
            unSelectedBubbleIconColor: AppColors.textSecondary,
            selectedBubbleLabelStyle: TextStyle(
              fontSize: AppFontSizes.sp12,
              fontWeight: AppFontWeights.w400,
              fontStyle: FontStyle.normal,
            ),
            unSelectedBubbleLabelStyle: TextStyle(
              fontSize: AppFontSizes.sp13,
              fontWeight: AppFontWeights.bold,
              fontStyle: FontStyle.normal,
            ),
            iconSize: AppPadding.r24,
            curveIn: Curves.easeIn,
            bubbleDuration: const Duration(milliseconds: 300),
            physics: const BouncingScrollPhysics(),
            margin: AppPadding.all5,
            padding: AppPadding.all5,
            innerIconLabelSpacing: 0,
            bubbleItemSize: AppPadding.r20,
            axis: Axis.horizontal,
            alignment: Alignment.bottomCenter,
            shapes: BubbleShape.circular,
          ),
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

class _KeepAliveWrapperState extends State<KeepAliveWrapper>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  bool get wantKeepAlive => true;
}
