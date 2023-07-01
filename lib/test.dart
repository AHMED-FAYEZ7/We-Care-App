import 'package:flutter/material.dart';
import 'package:health_care/authentication/domain/usecase/doctor_sinup_usecase.dart';
import 'package:health_care/authentication/domain/usecase/patient_signup_usecase.dart';
import 'package:health_care/authentication/domain/usecase/user_login_usecase.dart';
import 'package:health_care/core/app/app_prefs.dart';
import 'package:health_care/core/services/services_locator.dart';
import 'package:health_care/core/usecase/base_usecase.dart';
import 'package:health_care/patient/domain/usecase/book_appointment_use_case.dart';
import 'package:health_care/patient/domain/usecase/get_all_doctors_use_case.dart';
import 'package:health_care/patient/domain/usecase/get_docotrs_specialization_use_case.dart';
import 'package:health_care/patient/domain/usecase/get_doctor_by_id_use_case.dart';
import 'package:health_care/patient/domain/usecase/get_doctor_search_use_case.dart';
import 'package:health_care/patient/domain/usecase/get_rate_use_case.dart';
import 'package:health_care/patient/domain/usecase/get_top_doctors_use_case.dart';

import 'patient/domain/usecase/get_available_appointment_by_day_use_case.dart';
import 'patient/domain/usecase/get_available_apponitments_for_doctor_use_case.dart';

class TestPage extends StatelessWidget {
  TestPage({Key? key}) : super(key: key);
  final AppPreferences _appPreferences = sl<AppPreferences>();

  final UserLoginUseCase _userLoginUseCase = sl<UserLoginUseCase>();
  final GetAllDoctorsUseCase _allDoctorsUseCase = sl<GetAllDoctorsUseCase>();
  final GetTopDoctorsUseCase _getTopDoctorsUseCase = sl<GetTopDoctorsUseCase>();
  final GetDoctorsSpecializationUseCase _getDoctorsSpecialization =
      sl<GetDoctorsSpecializationUseCase>();
  final GetDoctorByIdUseCase _byIdUseCase = sl<GetDoctorByIdUseCase>();
  final GetDoctorSearchUseCase _searchUseCase = sl<GetDoctorSearchUseCase>();
  final GetAvailableAppointmentsForDoctorUseCase
      _getAvailableAppointmentsForDoctorUseCase =
      sl<GetAvailableAppointmentsForDoctorUseCase>();
  final GetAvailableAppointmentsByDay _availableAppointmentsByDay =
      sl<GetAvailableAppointmentsByDay>();
  final BookAppointmentUseCase _bookAppointmentUseCase =
      sl<BookAppointmentUseCase>();
  final GetDoctorRateUseCase _getDoctorRateUseCase = sl<GetDoctorRateUseCase>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 100,
          ),
          TextButton(
            onPressed: () async {
              // (await _getDoctorRateUseCase.call("649593403f0633e0bc1cb0c8"))
              //     .fold((l) {
              //   print(l.message.toString());
              // }, (r) {
              //   // print(r.availableAppointmentsData![0].appointmentId);
              //   print(r.reviews!.length);
              //   print(r.reviews![0].comment);
              //   print(r.reviews![0].rating);
              //   print(r.reviews![0].patient!.name);
              // });
              (await _searchUseCase.call(
                TwoParametersUseCase("mo", 'Heart'),
              ))
                  .fold((l) {
                print(l.message.toString());
              }, (r) {
                print("results:${r.results}");
                print("allDoctorsData:${r.allDoctorsData!.length}");
                print("topDoctorsData:${r.topDoctorsData!.length}");
                print("doctorsSearchData: ${r.doctorsSearchData!.length}");
                print(
                    "doctorsSpecializationData: ${r.doctorsSpecializationData!.length}");
              });
            },
            child: const Text(
              "Login Call",
            ),
          ),
        ],
      ),
    );
  }
}
