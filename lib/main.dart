import 'package:flutter/material.dart';
import 'package:health_care/core/app/app.dart';
import 'package:health_care/core/services/services_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  runApp(MyApp());
}
