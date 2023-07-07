import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:health_care/core/app/app.dart';
import 'package:health_care/core/services/services_locator.dart';

import 'bloc_observer.dart';

void main() async {
  BlocOverrides.runZoned(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await initAppModule();
      runApp(Phoenix(child: MyApp(),));
    },
    blocObserver: MyBlocObserver(),
  );
}
