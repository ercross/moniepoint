import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moniepoint/app/ui/graphics.dart';

part 'widgets/search_bar.dart';
part 'widgets/bottom_buttons.dart';
part 'widgets/property_location_pin.dart';

class PropertySearchScreen extends StatelessWidget {
  const PropertySearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ));
    final double horizontalMargin = MediaQuery.sizeOf(context).width * 0.070;
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
          child: const _SearchBar(),
        ),
        ..._randomisePropertyLocationPins(

            // search bar height + margin before search bar
            boundaryTop: 55 + 47,
            boundaryLeft: horizontalMargin),
        Positioned(
            bottom: 100,
            right: horizontalMargin,
            left: horizontalMargin,
            child: const _BottomButtons())
      ],
    );
  }
}
