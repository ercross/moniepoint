import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moniepoint/app/ui/screens/home/screen.dart';
import 'package:moniepoint/app/ui/screens/property_search/screen.dart';
import 'package:flutter_icon_snackbar/flutter_icon_snackbar.dart';

import '../../graphics.dart';

part 'bottom_nav_bar.dart';

class NavigableScreenScaffold extends StatefulWidget {
  const NavigableScreenScaffold({super.key});
  static const String route = "home";

  @override
  State<NavigableScreenScaffold> createState() =>
      _NavigableScreenScaffoldState();
}

class _NavigableScreenScaffoldState extends State<NavigableScreenScaffold> {
  // only two pages will be provided to PageController.
  // Hence, the homepage is the second page
  late final PageController _pageController;
  double _bottomNavBarPosition = -100;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: activeIndex.value);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 6500)).then((_) {
        setState(() => _bottomNavBarPosition = 30);
      });
    });
  }

  @override
  void dispose() {
    activeIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned(
            top: 0,
            width: MediaQuery.sizeOf(context).width,
            left: 0,
            height: MediaQuery.sizeOf(context).height,
            child: PageView(
              onPageChanged: (newIndex) => activeIndex.value = newIndex,
              controller: _pageController,
              children: const [PropertySearchScreen(), HomeScreen()],
            )),
        AnimatedPositioned(
            duration: const Duration(milliseconds: 2000),
            bottom: _bottomNavBarPosition,
            left: MediaQuery.sizeOf(context).width * 0.175,
            right: MediaQuery.sizeOf(context).width * 0.175,
            child: _CustomBottomNavBar(onTapIndex: _onClickPage))
      ]),
    );
  }

  _onClickPage(int index) {
    if (index == activeIndex.value) {
      // no-op
      return;
    }
    if (index < 2) {
      _pageController.animateToPage(index,
          duration: const Duration(milliseconds: 750), curve: Curves.easeInOut);
      activeIndex.value = index;
      return;
    }

    IconSnackBar.show(context,
        backgroundColor: Theme.of(context).colorScheme.surfaceContainerHigh,
        labelTextStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Theme.of(context).colorScheme.secondaryFixedDim),
        snackBarType: SnackBarType.alert,
        iconColor: Theme.of(context).colorScheme.secondaryFixedDim,
        label: 'Page not implemented');
  }
}
