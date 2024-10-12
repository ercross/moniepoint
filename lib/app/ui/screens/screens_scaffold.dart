import 'package:flutter/material.dart';
import 'package:moniepoint/app/ui/screens/home/screen.dart';
import 'package:moniepoint/app/ui/shared_widgets/botton_nav_bar.dart';

class NavigableScreenScaffold extends StatelessWidget {
  const NavigableScreenScaffold({super.key});
  static const String route = "home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned(
            top: 0,
            width: MediaQuery.sizeOf(context).width,
            left: 0,
            height: MediaQuery.sizeOf(context).height,
            child: const HomeScreen()),
        const Positioned(
            bottom: 30, left: 0, right: 0, child: CustomBottomNavBar())
      ]),
    );
  }
}
