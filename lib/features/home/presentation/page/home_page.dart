import 'package:flutter/material.dart';

import '../../../../core/util/widgets/repsonsive_view_widget.dart';
import '../view/home_screen_mobile_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveView(mobile: HomeScreenMobileView());
  }
}
