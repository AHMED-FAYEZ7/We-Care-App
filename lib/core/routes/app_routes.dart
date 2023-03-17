import 'package:flutter/material.dart';
import 'package:health_care/authentication/presentation/screens/doctor/doctor_register_screen.dart';
import 'package:health_care/authentication/presentation/screens/onboarding/onboarding_screen.dart';
import 'package:health_care/authentication/presentation/screens/patient/patient_register_screen.dart';
import 'package:health_care/authentication/presentation/screens/splash/splash_screen.dart';
import 'package:health_care/authentication/presentation/screens/toggle/toggle_screen.dart';
import 'package:health_care/authentication/presentation/screens/user/user_email_confirmation_screen.dart';
import 'package:health_care/authentication/presentation/screens/user/user_forget_password_screen.dart';
import 'package:health_care/authentication/presentation/screens/user/user_login_screen.dart';
import 'package:health_care/authentication/presentation/screens/user/user_update_password_screen.dart';
import 'package:health_care/core/global/resources/strings_manger.dart';
import 'package:health_care/core/services/services_locator.dart';
import 'package:health_care/doctor/presentation/screens/doctor_main_screen.dart';
import 'package:health_care/patient/presentation/screens/patient_main_screen.dart';
import 'package:health_care/test.dart';

class Routes {
  static const String splashRoute = "/";
  static const String testRoute = "/test";
  static const String onBoardingRoute = "/onBoarding";
  static const String toggleRoute = "/toggle";
  static const String userLoginRoute = "/userLogin";
  static const String userEmailConfirmationRoute = "/userEmailConfirmation";
  static const String userForgetPasswordRoute = "/userForgetPassword";
  static const String userUpdatePasswordRoute = "/userUpdatePassword";
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
      case Routes.testRoute:
        initUserModule();
        initUserDeleteMeModule();
        return MaterialPageRoute(builder: (_) => TestPage());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => OnBoardingScreen());
      case Routes.toggleRoute:
        return MaterialPageRoute(builder: (_) => const ToggleScreen());
      case Routes.doctorRegisterRoute:
        initDoctorSignUpModule();
        return MaterialPageRoute(builder: (_) => const DoctorRegisterScreen());
      case Routes.userLoginRoute:
        initUserModule();
        initUserLoginModule();
        return MaterialPageRoute(builder: (_) => UserLoginScreen());
      case Routes.userEmailConfirmationRoute:
        initUserModule();
        initUserEmailConfirmationModule();
        return MaterialPageRoute(
            builder: (_) => const UserEmailConfirmationScreen());
      case Routes.userForgetPasswordRoute:
        initUserModule();
        initUserForgetPasswordModule();
        return MaterialPageRoute(
            builder: (_) => const UserForgetPasswordScreen());
      case Routes.userUpdatePasswordRoute:
        initUserModule();
        initUserUpdatePasswordModule();
        return MaterialPageRoute(
            builder: (_) => const UserUpdatePasswordScreen());
      case Routes.patientRegisterRoute:
        initPatientSignUpModule();
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
