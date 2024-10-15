import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moniepoint/app/ui/graphics.dart';
import 'package:pretty_animated_text/pretty_animated_text.dart';

part 'widgets/app_bar.dart';
part 'widgets/offers_count.dart';
part 'widgets/properties_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String route = "home";
  static const double _topScreenPadding = 16.0;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _greetingTextOpacity = 0;
  double _propertyViewTopPosition = 500;
  late bool _showPropertySection;
  late bool _showAppBar;
  late bool _showAnimatedGreetings;
  late bool _showDashboardOverviewSection;
  final Duration _animationProgressBaseInterval =
      const Duration(milliseconds: 500);
  final Duration _appBarAnimationDuration = const Duration(milliseconds: 1200);
  final Duration _offersCountContainerAnimationDuration =
      const Duration(milliseconds: 1500);
  final Duration _greetingsAnimationDuration =
      const Duration(milliseconds: 1500);
  final Duration _propertySectionAnimationDuration =
      const Duration(milliseconds: 3000);
  static const double _offersCountHeight = 172;

  @override
  void initState() {
    super.initState();
    _showPropertySection = false;
    _showAppBar = false;
    _showAnimatedGreetings = false;
    _showDashboardOverviewSection = false;
    _consecutivelyStartAnimations();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Transparent status bar
      statusBarIconBrightness: Brightness.dark, // Dark icons (black)
      statusBarBrightness: Brightness.light, // For iOS devices
    ));
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: const [
            0.159,
            0.841
          ],
              colors: [
            Theme.of(context).colorScheme.surfaceBright,
            Theme.of(context).colorScheme.surfaceDim
          ])),
      child: SafeArea(
        minimum: const EdgeInsets.only(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (_showAppBar)
              _AppBar(animationDuration: _appBarAnimationDuration),
            const SizedBox(height: 40),

            // animated greeting text 1
            if (_showAnimatedGreetings)
              AnimatedOpacity(
                duration: _greetingsAnimationDuration,
                opacity: _greetingTextOpacity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: HomeScreen._topScreenPadding,
                  ),
                  child: Text("Hi, Marina",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).colorScheme.secondary)),
                ),
              ),
            const SizedBox(height: 4),

            // animated greeting text 2
            if (_showAnimatedGreetings)
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: HomeScreen._topScreenPadding,
                ),
                margin: EdgeInsets.only(
                  right: MediaQuery.sizeOf(context).width * 0.3,
                ),
                child: OffsetText(
                  text: "let's select your perfect place",
                  duration: const Duration(seconds: 4),
                  type: AnimationType.word,
                  slideType: SlideAnimationType.bottomTop,
                  textStyle: TextStyle(
                      fontSize: 28,
                      height: 1.1,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).colorScheme.tertiary),
                ),
              ),
            const SizedBox(height: 50),

            // animated dashboard-overview section
            if (_showDashboardOverviewSection)
              Expanded(
                child: LayoutBuilder(builder: (_, constraints) {
                  return Stack(
                    children: [
                      Positioned(
                        top: 0,
                        left: 0,
                        height: _offersCountHeight,
                        right: 0,
                        child: Center(
                            child: _OffersCount(
                          animationDuration:
                              _offersCountContainerAnimationDuration,
                        )),
                      ),
                      if (_showPropertySection)
                        AnimatedPositioned(
                            curve: Curves.fastOutSlowIn,
                            duration: _propertySectionAnimationDuration,
                            top: _propertyViewTopPosition,
                            left: 0,
                            right: 0,
                            child: const _PropertiesSectionView())
                    ],
                  );
                }),
              ),
          ],
        ),
      ),
    );
  }

  _consecutivelyStartAnimations() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // show app bar
      Future.delayed(_animationProgressBaseInterval, () {
        setState(() => _showAppBar = true);
      });

      // show animated greetings
      final greetingsDisplayDelay = Duration(
          milliseconds: _appBarAnimationDuration.inMilliseconds +
              _animationProgressBaseInterval.inMilliseconds);
      Future.delayed(greetingsDisplayDelay, () {
        setState(() => _showAnimatedGreetings = true);

        // start greetings opacity animation
        Future.delayed(const Duration(milliseconds: 100), () {
          setState(() => _greetingTextOpacity = 1);
        });
      });

      // show dashboard overview section
      final dashboardOverviewSectionDisplayDelay = Duration(
          milliseconds: greetingsDisplayDelay.inMilliseconds +
              _greetingsAnimationDuration.inMilliseconds);
      Future.delayed(dashboardOverviewSectionDisplayDelay, () {
        setState(() => _showDashboardOverviewSection = true);

        // show property section
        Future.delayed(_offersCountContainerAnimationDuration, () {
          setState(() {
            _showPropertySection = true;
          });
        });
        Future.delayed(
            Duration(
                milliseconds:
                    _offersCountContainerAnimationDuration.inMilliseconds +
                        600), () {
          setState(() {
            _propertyViewTopPosition = 0;
          });
          Future.delayed(
              Duration(
                  milliseconds:
                      _propertySectionAnimationDuration.inMilliseconds + 1000),
              () {
            setState(() => _propertyViewTopPosition = _offersCountHeight + 30);
          });
        });
      });
    });
  }
}
