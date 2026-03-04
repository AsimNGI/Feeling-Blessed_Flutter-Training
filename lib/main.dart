import 'package:animated_bubble_navigation_bar/animated_bubble_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_training/ui/gallery_screen.dart';
import 'package:flutter_training/ui/org_detail_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(402, 874),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            textTheme: GoogleFonts.robotoTextTheme(
              Theme.of(context).textTheme, // Inherits existing theme properties
            ),
          ),
          home: MyHomePage(),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Widget> _screens = const [
    KeepAliveWrapper(child: MyGallery()),
    KeepAliveWrapper(
      child: OrgDetailScreen(
        org: Organization(
          name: "Abdul Sattar Edhi International Foundation",
          location: "City, Country",
          website: "website.com",
          coverImagePath: "assets/images/cover_image.png",
          logoPath: "assets/images/edhi.png",
        ),
      ),
    ),
    KeepAliveWrapper(child: Text("Profile")),
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

          /// This is the main decoration for the bubbles in the navigation bar.
          /// You can customize colors, text styles, icon sizes, animations, and more.
          /// For more details, refer to the documentation.
          bubbleDecoration: BubbleDecoration(
            // Colors
            backgroundColor: const Color(0xFFF2F4F7),
            selectedBubbleBackgroundColor: const Color(0xFFD0D5DD),
            unSelectedBubbleBackgroundColor: const Color(0xFFF2F4F7),
            selectedBubbleLabelColor: Colors.black87,
            unSelectedBubbleLabelColor: Colors.white,
            selectedBubbleIconColor: Colors.black87,
            unSelectedBubbleIconColor: Colors.black45,

            // Text
            selectedBubbleLabelStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            ),

            unSelectedBubbleLabelStyle: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal,
            ),

            // Icon
            iconSize: 24,

            // Behavior & Animation
            curveIn: Curves.easeIn,
            bubbleDuration: const Duration(milliseconds: 300),
            physics: const BouncingScrollPhysics(),

            // Padding & Margin
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(5),

            innerIconLabelSpacing: 0,

            // Layout & Shape
            bubbleItemSize: 20,
            axis: Axis.horizontal,
            alignment: Alignment.bottomCenter,
            shapes: BubbleShape.circular,
          ),
        ),
      ),
    );
  }
}

/// A wrapper widget to keep the state of the child widget alive
/// optional but recommended for better performance
/// when using AnimatedBubbleNavBar without screen-transition-builder.
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
