import 'package:flutter/material.dart';
import 'package:health_care/authentication/presentation/screens/doctor/doctor_login/doctor_login_screen.dart';
import 'package:health_care/authentication/presentation/screens/doctor/doctor_register/doctor_register_screen.dart';
import 'package:health_care/authentication/presentation/screens/onboarding/onboarding_screen.dart';
import 'package:health_care/authentication/presentation/screens/patient/patient_login/patient_login_screen.dart';
import 'package:health_care/authentication/presentation/screens/patient/patient_register/patient_register_screen.dart';
import 'package:health_care/authentication/presentation/screens/splash/splash_screen.dart';
import 'package:health_care/authentication/presentation/screens/toggle/toggle_screen.dart';
import 'package:health_care/core/global/resources/strings_manger.dart';
import 'package:health_care/doctor/presentation/screens/doctor_main_screen.dart';
import 'package:health_care/patient/presentation/screens/patient_main_screen.dart';

class Routes {
  static const String splashRoute = "/";
  static const String onBoardingRoute = "/onBoarding";
  static const String toggleRoute = "/toggle";
  static const String doctorLoginRoute = "/doctorLogin";
  static const String patientLoginRoute = "/patientLogin";
  static const String doctorRegisterRoute = "/doctorRegister";
  static const String patientRegisterRoute = "/patientRegister";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String doctorMainRoute = "/doctorMain";
  static const String patientMainRoute = "/patientMain";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => OnBoardingScreen());
      case Routes.toggleRoute:
        return MaterialPageRoute(builder: (_) => const ToggleScreen());
      case Routes.doctorLoginRoute:
        return MaterialPageRoute(builder: (_) => DoctorLoginScreen());
      case Routes.doctorRegisterRoute:
        return MaterialPageRoute(builder: (_) => const DoctorRegisterScreen());
      case Routes.patientLoginRoute:
        return MaterialPageRoute(builder: (_) => PatientLoginScreen());
      case Routes.patientRegisterRoute:
        return MaterialPageRoute(builder: (_) => const PatientRegisterScreen());
      case Routes.doctorMainRoute:
        return MaterialPageRoute(builder: (_) => const DoctorMainScreen());
      case Routes.patientMainRoute:
        return MaterialPageRoute(builder: (_) => const PatientMainScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(
            AppStrings.noRouteFound,
          ),
        ),
        body: const Center(
          child: Text(
            AppStrings.noRouteFound,
          ),
        ),
      ),
    );
  }
}
