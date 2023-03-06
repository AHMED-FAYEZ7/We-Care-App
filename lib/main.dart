import 'package:flutter/material.dart';

import 'authentication/presentation/screens/onboarding_screen.dart';
import 'core/global/theme/theme_data/theme_data_light.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: getThemeDataLight(),
      home: const OnBoardingScreen(),
    );
  }
}
