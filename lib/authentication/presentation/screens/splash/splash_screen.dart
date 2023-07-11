import 'dart:async';

import 'package:flutter/material.dart';
import 'package:health_care/core/app/app_prefs.dart';
import 'package:health_care/core/assets/app_assets.dart';
import 'package:health_care/core/routes/app_routes.dart';
import 'package:health_care/core/services/services_locator.dart';
import 'package:health_care/core/utils/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;
  final AppPreferences _appPreferences = sl<AppPreferences>();

  _startDelay() {
    _timer = Timer(const Duration(seconds: 2), _goNext);
  }

  _goNext() async {
    // Navigator.pushReplacementNamed(context, Routes.testRoute);
    _appPreferences.isDoctorLoggedIn().then((isDoctorLoggedIn) {
      if (isDoctorLoggedIn) {
        Navigator.pushReplacementNamed(context, Routes.layoutDoctorRoute);
      } else {
        _appPreferences.isPatientLoggedIn().then((isPatientLoggedIn) {
          if (isPatientLoggedIn) {
            Navigator.pushReplacementNamed(context, Routes.layoutPatientRoute);
          } else {
            _appPreferences
                .isOnBoardingScreenViewed()
                .then((isOnBoardingScreenViewed) {
              if (isOnBoardingScreenViewed) {
                Navigator.pushReplacementNamed(context, Routes.userLoginRoute);
              } else {
                Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
              }
            });
          }
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    if (Constants.isLogout == false) {
      _startDelay();
    }
  }

  @override
  void dispose() {
    if (Constants.isLogout == false) {
      _timer!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image(
          image: AssetImage(ImageAssets.splashLogo),
        ),
      ),
    );
  }
}
