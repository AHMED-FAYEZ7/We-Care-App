import 'package:flutter/material.dart';
import 'package:health_care/authentication/domain/usecase/patient_signup_usecase.dart';
import 'package:health_care/core/services/services_locator.dart';

import 'authentication/presentation/screens/onboarding_screen.dart';
import 'core/global/theme/theme_data/theme_data_light.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: getThemeDataLight(),
      home: OnBoardingScreen(),
    );
  }
}
