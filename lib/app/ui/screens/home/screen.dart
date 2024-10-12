import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moniepoint/app/ui/graphics.dart';

part 'widgets/app_bar.dart';
part 'widgets/offers_count.dart';
part 'widgets/properties_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String route = "home";
  static const double _topScreenPadding = 16.0;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Transparent status bar
      statusBarIconBrightness: Brightness.dark, // Dark icons (black)
      statusBarBrightness: Brightness.light, // For iOS devices
    ));
    return Scaffold(
        body: Container(
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
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).colorScheme.secondary)),
              ),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: HomeScreen._topScreenPadding,
                ),
                margin: EdgeInsets.only(
                  right: MediaQuery.sizeOf(context).width * 0.3,
                ),
                child: Text(
                  "let's select your perfect place",
                  style: TextStyle(
                      fontSize: 28,
                      height: 1.1,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).colorScheme.tertiary),
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
