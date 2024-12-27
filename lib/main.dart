import 'package:flutter/material.dart';
import 'routes.dart';
import 'utils/theme.dart';
import 'screens/home_screen.dart';
void main() {
  runApp(const ZapTheGapApp());
}

class ZapTheGapApp extends StatelessWidget {
  const ZapTheGapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zap The Gap',
      theme: ZapTheGapTheme.lightTheme,
      initialRoute: '/',
      home: const HomeScreen(),
      routes: appRoutes, // Defined in routes.dart
    );
  }
}
