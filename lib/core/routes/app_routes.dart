import 'package:flutter/material.dart';
import 'package:health_care/authentication/domain/model/user_model.dart';
import 'package:health_care/authentication/presentation/screens/doctor/doctor_register_screen.dart';
import 'package:health_care/authentication/presentation/screens/onboarding/onboarding_screen.dart';
import 'package:health_care/authentication/presentation/screens/patient/patient_register_screen.dart';
import 'package:health_care/authentication/presentation/screens/splash/splash_screen.dart';
import 'package:health_care/authentication/presentation/screens/toggle/toggle_screen.dart';
import 'package:health_care/authentication/presentation/screens/user/user_email_confirmation_screen.dart';
import 'package:health_care/authentication/presentation/screens/user/user_forget_password_screen.dart';
import 'package:health_care/authentication/presentation/screens/user/user_login_screen.dart';
import 'package:health_care/authentication/presentation/screens/user/user_update_info_screen.dart';
import 'package:health_care/authentication/presentation/screens/user/user_update_password_screen.dart';
import 'package:health_care/chat/presentation/screens/chat_screen.dart';
import 'package:health_care/core/global/resources/strings_manger.dart';
import 'package:health_care/core/screens/start_func/start_function_screen.dart';
import 'package:health_care/core/screens/video/video_screen.dart';
import 'package:health_care/patient/presentation/screens/doctor_posts/doctor_posts_screen.dart';
import 'package:health_care/patient/presentation/screens/payment/payment_screen.dart';
import 'package:health_care/post/presentation/screen/create_post/create_post_screen.dart';
import 'package:health_care/doctor/presentation/screens/doctor_layout/doctor_layout_screen.dart';
import 'package:health_care/patient/domain/model/appointment_model.dart';
import 'package:health_care/patient/domain/model/rarte_model.dart';
import 'package:health_care/patient/presentation/screens/book_appointment/book_appointment_screen.dart';
import 'package:health_care/patient/presentation/screens/doctor_profile/doctor_profile_screen.dart';
import 'package:health_care/patient/presentation/screens/layout/layout_screen.dart';
import 'package:health_care/patient/presentation/screens/reviews/reviews_screen.dart';
import 'package:health_care/patient/presentation/screens/search/search_screen.dart';
import 'package:health_care/patient/presentation/screens/specialist_doctor/specialist_doctor.dart';
import 'package:health_care/patient/presentation/screens/top_doctor/top_doctor.dart';
import 'package:health_care/patient/presentation/screens/write_review/rate_review_screen.dart';
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
  static const String userUpdateInfoRoute = "/userUpdateInfo";
  static const String doctorRegisterRoute = "/doctorRegister";
  static const String patientRegisterRoute = "/patientRegister";
  static const String forgotPasswordRoute = "/forgotPassword";

  /////////////doctor//////////////
  static const String layoutDoctorRoute = "/layoutDoctor";
  static const String createPostRoute = "/createPost";

  /////////////patient//////////////
  static const String layoutPatientRoute = "/layoutPatient";
  static const String searchPatientRoute = "/searchPatient";
  static const String specialistDoctorPatientRoute = "/specialistDoctorPatient";
  static const String topDoctorPatientRoute = "/topDoctorPatient";
  static const String doctorProfilePatientRoute = "/doctorProfilePatient";
  static const String bookAppointmentRoute = "/bookAppointment";
  static const String reviewsRoute = "/reviews";
  static const String writeReviewRoute = "/writeReview";
  static const String paymentRoute = "/payment";
  static const String startFuncRoute = "/startFunc";
  static const String videoRoute = "/videoFunc";
  static const String doctorPostsRoute = "/doctorPosts";

////////////////Chat/////////////
  static const String chatRoute = "/chatRoute";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.testRoute:
        return MaterialPageRoute(builder: (_) => TestPage());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => OnBoardingScreen());
      case Routes.toggleRoute:
        return MaterialPageRoute(builder: (_) => const ToggleScreen());
      case Routes.doctorRegisterRoute:
        return MaterialPageRoute(builder: (_) => DoctorRegisterScreen());
      case Routes.userLoginRoute:
        return MaterialPageRoute(builder: (_) => UserLoginScreen());
      case Routes.userEmailConfirmationRoute:
        return MaterialPageRoute(
            builder: (_) => const UserEmailConfirmationScreen());
      case Routes.userForgetPasswordRoute:
        return MaterialPageRoute(
            builder: (_) => const UserForgetPasswordScreen());
      case Routes.userUpdatePasswordRoute:
        return MaterialPageRoute(
            builder: (_) => const UserUpdatePasswordScreen());
      case Routes.userUpdateInfoRoute:
        return MaterialPageRoute(builder: (_) => const UserUpdateInfoScreen());
      case Routes.patientRegisterRoute:
        return MaterialPageRoute(builder: (_) => PatientRegisterScreen());
      /////////////doctor//////////////
      case Routes.layoutDoctorRoute:
        return MaterialPageRoute(builder: (_) => const DoctorLayoutScreen());
      case Routes.createPostRoute:
        return MaterialPageRoute(builder: (_) => CreatePostScreen());
      /////////////patient//////////////
      case Routes.layoutPatientRoute:
        return MaterialPageRoute(builder: (_) => const LayoutPatientScreen());
      case Routes.searchPatientRoute:
        return MaterialPageRoute(builder: (_) => SearchPatientScreen());
      case Routes.specialistDoctorPatientRoute:
        return MaterialPageRoute(
            builder: (_) => const SpecialistDoctorPatientScreen());
      case Routes.topDoctorPatientRoute:
        return MaterialPageRoute(builder: (_) => TopDoctorPatientScreen());
      case Routes.doctorProfilePatientRoute:
        final User doctorModel = routeSettings.arguments as User;
        return MaterialPageRoute(
            builder: (_) => DoctorProfilePatientScreen(
                  doctorModel: doctorModel,
                ));
      case Routes.paymentRoute:
        final Map<String, dynamic> arguments =
            routeSettings.arguments as Map<String, dynamic>;
        final String url = arguments['url'] as String;
        final String sessionId = arguments['sessionId'] as String;
        final String appointmentId = arguments['appointmentId'] as String;
        return MaterialPageRoute(
            builder: (_) => PaymentScreen(
                  url: url,
                  sessionId: sessionId,
                  appointmentId: appointmentId,
                ));
      case Routes.videoRoute:
        final Map<String, dynamic> arguments =
            routeSettings.arguments as Map<String, dynamic>;
        final String userID = arguments['userID'] as String;
        final String userName = arguments['userName'] as String;
        return MaterialPageRoute(
            builder: (_) => VideoScreen(
                  userID: userID,
                  userName: userName,
                ));
      case Routes.startFuncRoute:
        final Map<String, dynamic> arguments =
            routeSettings.arguments as Map<String, dynamic>;
        final UserMyAppointments model =
            arguments['model'] as UserMyAppointments;
        final String type = arguments['type'] as String;
        return MaterialPageRoute(
            builder: (_) => StartFunctionScreen(
                  model: model,
                  type: type,
                ));
      case Routes.bookAppointmentRoute:
        final Map<String, dynamic> arguments =
            routeSettings.arguments as Map<String, dynamic>;
        final List<BaseAppointment> appointmentList =
            arguments['appointmentList'] as List<BaseAppointment>;
        final String date = arguments['date'] as String;
        final String day = arguments['day'] as String;
        return MaterialPageRoute(
            builder: (_) => BookAppointmentScreen(
                  appointmentList: appointmentList,
                  date: date,
                  day: day,
                ));
      case Routes.reviewsRoute:
        return MaterialPageRoute(builder: (_) => ReviewsScreen());
      case Routes.doctorPostsRoute:
        return MaterialPageRoute(builder: (_) => const DoctorPostsScreen());
      case Routes.writeReviewRoute:
        return MaterialPageRoute(builder: (_) => WriteReviewScreen());
      case Routes.chatRoute:
        final Map<String, dynamic> arguments =
            routeSettings.arguments as Map<String, dynamic>;
        final String senderId = arguments['senderId'] as String;
        final String receiverId = arguments['receiverId'] as String;
        final String name = arguments['name'] as String;
        final String type = arguments['type'] as String;
        final String appointmentId = arguments['appointmentId'] as String;
        // // final String roomId = routeSettings.arguments as String;
        // String senderId = "64b0939587109c94b6da96df";
        // String receiverId = "64b093301f07f3fef0d6872a";

        String roomId = "6458ccfba57c498eef445131";

        return MaterialPageRoute(
            builder: (_) => ChatScreen(
                  senderId: senderId,
                  receiverId: receiverId,
                  name: name,
                  type: type,
                  appointmentId: appointmentId,
                  // roomId: roomId,
                ));
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
