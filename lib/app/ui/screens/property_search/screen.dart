import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moniepoint/app/ui/graphics.dart';

part 'widgets/search_bar.dart';
part 'widgets/bottom_buttons.dart';
part 'widgets/property_location_pin.dart';
part 'widgets/stack_menu.dart';

class PropertySearchScreen extends StatefulWidget {
  const PropertySearchScreen({super.key});

  @override
  State<PropertySearchScreen> createState() => _PropertySearchScreenState();
}

class _PropertySearchScreenState extends State<PropertySearchScreen> {
  final Duration _animationDuration = const Duration(milliseconds: 1500);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ));
    final double horizontalMargin = MediaQuery.sizeOf(context).width * 0.085;
    return Stack(
      children: [
        Positioned.fill(
            child: Image.asset(
          AppImage.mapView,
          fit: BoxFit.cover,
        )),
        Positioned(
          right: horizontalMargin,
          left: horizontalMargin,
          top: 55,
          height: 45,
          child: _SearchBar(
            animationDuration: _animationDuration,
          ),
        ),
        ..._randomisePropertyLocationPins(
            animationDuration: _animationDuration,

            // search bar height + margin before search bar
            boundaryTop: 55 + 47,
            boundaryLeft: horizontalMargin),
        Positioned(
            bottom: 100,
            right: horizontalMargin,
            left: horizontalMargin,
            child: _BottomButtons(animationDuration: _animationDuration))
      ],
    );
  }
}
