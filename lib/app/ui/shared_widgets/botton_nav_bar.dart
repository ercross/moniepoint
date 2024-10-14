import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../graphics.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width * 0.16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: Theme.of(context).colorScheme.tertiary.withOpacity(0.8)),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _Item(isActive: false, svgIconAsset: AppIcon.search_filled),
          _Item(isActive: false, svgIconAsset: AppIcon.chat),
          _Item(isActive: true, svgIconAsset: AppIcon.home),
          _Item(isActive: false, svgIconAsset: AppIcon.favorite),
          _Item(isActive: false, svgIconAsset: AppIcon.person),
        ],
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final bool isActive;
  final String svgIconAsset;
  const _Item({required this.isActive, required this.svgIconAsset});

  @override
  Widget build(BuildContext context) {
    const double iconSize = 22;
    final double circleSize = isActive ? 50 : 40;
    return Container(
      height: circleSize,
      width: circleSize,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isActive
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.tertiary),
      child: SvgPicture.asset(
        height: iconSize,
        width: iconSize,
        fit: BoxFit.contain,
        svgIconAsset,
        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
      ),
    );
  }
}
