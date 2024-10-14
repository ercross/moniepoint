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
  int _activeIndex = 1;

  // only two pages will be provided to PageController.
  // Hence, the homepage is the second page
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _activeIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
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
              onPageChanged: (newIndex) => setState(() => _activeIndex = newIndex),
              controller: _pageController,
              children: const [PropertySearchScreen(), HomeScreen()],
            )),
        Positioned(
            bottom: 30,
            left: MediaQuery.sizeOf(context).width * 0.16,
            right: MediaQuery.sizeOf(context).width * 0.16,
            child: _CustomBottomNavBar(
              activeIndex: _activeIndex,
              onTapIndex: _onClickPage,
            ))
      ]),
    );
  }

  _onClickPage(int index) {
    if (index == _activeIndex) {
      // no-op
      return;
    }
    if (index < 2) {
      _pageController.animateToPage(index,
          duration: const Duration(milliseconds: 750), curve: Curves.easeInOut);
      setState(() => _activeIndex = index);
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
