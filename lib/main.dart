import 'package:flutter/material.dart';

import 'app/ui/screens/screens_scaffold/scaffold.dart';
import 'app/ui/theme.dart';

void main() {
  runApp(const Moniepoint());
}

class Moniepoint extends StatelessWidget {
  const Moniepoint({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {NavigableScreenScaffold.route: (context) => const NavigableScreenScaffold()},
      initialRoute: NavigableScreenScaffold.route,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightMode,
    );
  }
}
