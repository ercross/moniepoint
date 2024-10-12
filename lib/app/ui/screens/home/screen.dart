import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moniepoint/app/ui/colors.dart';
import 'package:moniepoint/app/ui/graphics.dart';

part 'widgets/app_bar.dart';
part 'widgets/offers_count.dart';
part 'widgets/properties_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String route = "home";
  static const double _topScreenPadding = 18.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [AppColor.backgroundLight, AppColor.backgroundDeep])),
      child: SafeArea(
        minimum: const EdgeInsets.only(top: 40),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _AppBar(),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: _topScreenPadding,
                ),
                child: Text("Hi, Marina",
                    style: Theme.of(context).textTheme.bodyMedium),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: HomeScreen._topScreenPadding,
                ),
                margin: EdgeInsets.only(
                  right: MediaQuery.sizeOf(context).width * 0.3,
                ),
                child: Text(
                  "Let's select your perfect place",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              const SizedBox(height: 50),
              const _OffersCount(
                itemsHeight: 170,
              ),
              const _PropertiesSectionView()
            ],
          ),
        ),
      ),
    ));
  }
}
