import 'package:flutter/material.dart';
import 'package:moniepoint/app/ui/screens/home/screen.dart';

import 'app/ui/theme.dart';

void main() {
  runApp(const Moniepoint());
}

class Moniepoint extends StatelessWidget {
  const Moniepoint({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {HomeScreen.route: (context) => const HomeScreen()},
      initialRoute: HomeScreen.route,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightMode,
    );
  }
}
