import 'package:flutter/material.dart';
import 'package:health_care/authentication/domain/usecase/doctor_sinup_usecase.dart';
import 'package:health_care/authentication/domain/usecase/patient_signup_usecase.dart';
import 'package:health_care/authentication/domain/usecase/user_login_usecase.dart';
import 'package:health_care/core/app/app_prefs.dart';
import 'package:health_care/core/services/services_locator.dart';
import 'package:health_care/core/usecase/base_usecase.dart';
import 'package:health_care/patient/domain/usecase/get_all_doctors_use_case.dart';
import 'package:health_care/patient/domain/usecase/get_docotrs_specialization_use_case.dart';
import 'package:health_care/patient/domain/usecase/get_doctor_by_id_use_case.dart';
import 'package:health_care/patient/domain/usecase/get_doctor_search_use_case.dart';
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
              // (await _allDoctorsUseCase.call("")).fold((l) {
              //   print(l.message.toString());
              // }, (r) {
              //   print("results:${r.results}");
              //   print("allDoctorsData:${r.allDoctorsData!.length}");
              //   print("topDoctorsData:${r.topDoctorsData!.length}");
              //   print("doctorsSearchData: ${r.doctorsSearchData!.length}");
              //   print(
              //       "doctorsSpecializationData: ${r.doctorsSpecializationData!.length}");
              //   // print(r.doctorsData![1].name);
              //   // print(r.doctorsData![2].fees);
              //   // print(r.doctorsData![4].averageRating);
              //   // print(r.doctorsData![5].timePerPatient);
              // });
              // (await _getDoctorsSpecialization.call("heart")).fold((l) {
              //   print(l.message.toString());
              // }, (r) {
              //   // print(r.results);
              //   // print(r.doctorsNum);
              //   print("results:${r.results}");
              //   print("allDoctorsData:${r.allDoctorsData!.length}");
              //   print("topDoctorsData:${r.topDoctorsData!.length}");
              //   print("doctorsSearchData: ${r.doctorsSearchData!.length}");
              //   print(
              //       "doctorsSpecializationData: ${r.doctorsSpecializationData!.length}");
              //
              //   // print(r.doctorsData![1].name);
              //   // print(r.doctorsData![2].fees);
              //   // print(r.doctorsData![4].averageRating);
              //   // print(r.doctorsData![5].timePerPatient);
              // });
              //
              (await _getAvailableAppointmentsForDoctorUseCase
                      .call("6491a45e0781cc8fbabc0035"))
                  .fold((l) {
                print(l.message.toString());
              }, (r) {
                // print(r.availableAppointmentsData![0].appointmentId);
                print(r.availableAppointmentsData!.length);
                // print(r.user!.name);
                // print(r.user!.specialization);
                // print(r.user!.fees);
                // print(r.user!.scheduleTiming.length);
                // print("sss${r.token}");

                // print(r.doctorsData![1].name);
                // print(r.doctorsData![2].fees);
                // print(r.doctorsData![4].averageRating);
                // print(r.doctorsData![5].timePerPatient);
              });
              (await _availableAppointmentsByDay.call(TwoParametersUseCase(
                "6491a45e0781cc8fbabc0035",
                "2023-10-15",
              )))
                  .fold((l) {
                print(l.message.toString());
              }, (r) {
                // print(r.availableAppointmentsByDayData![0].appointmentId);
                // print(r.availableAppointmentsData!.length);
                // print(r.);
                print(r.availableAppointmentsByDayData!.length);
                // print(r.user!.name);
                // print(r.user!.specialization);
                // print(r.user!.fees);
                // print(r.user!.scheduleTiming.length);
                // print("sss${r.token}");

                // print(r.doctorsData![1].name);
                // print(r.doctorsData![2].fees);
                // print(r.doctorsData![4].averageRating);
                // print(r.doctorsData![5].timePerPatient);
              });
              // String token = await _appPreferences.getToken();
              // print(token);
              // (await _searchUseCase.call("voltttt")).fold((l) {
              //   print(l.message.toString());
              // }, (r) {
              //   print("results:${r.results}");
              //   print("allDoctorsData:${r.allDoctorsData!.length}");
              //   print("topDoctorsData:${r.topDoctorsData!.length}");
              //   print("doctorsSearchData: ${r.doctorsSearchData!.length}");
              //   print(
              //       "doctorsSpecializationData: ${r.doctorsSpecializationData!.length}");
              //
              //   // print(r.results);
              //   // print(r.allDoctorsData![2].userName);
              //   // print(r.allDoctorsData![3].userName);
              //
              //   // print(r.doctorsData![1].name);
              //   // print(r.doctorsData![2].fees);
              //   // print(r.doctorsData![4].averageRating);
              //   // print(r.doctorsData![5].timePerPatient);
              // });
              //
              // (await _getTopDoctorsUseCase.call(
              //         // input: "Heart",
              //         ))
              //     .fold((l) {
              //   print(l.message.toString());
              // }, (r) {
              //   // print(r.results);
              //   print("results:${r.results}");
              //   print("allDoctorsData:${r.allDoctorsData!.length}");
              //   print("topDoctorsData:${r.topDoctorsData!.length}");
              //   print("doctorsSearchData: ${r.doctorsSearchData!.length}");
              //   print(
              //       "doctorsSpecializationData: ${r.doctorsSpecializationData!.length}");
              //   // print(r.topDoctorsData![0].userName);
              //   // print(r.allDoctorsData![1].userName);
              //   // print(r.allDoctorsData![3].userName);

              //   // print(r.doctorsData![1].name);
              //   // print(r.doctorsData![2].fees);
              //   // print(r.doctorsData![4].averageRating);
              //   // print(r.doctorsData![5].timePerPatient);
              // });

              // _appPreferences.clearSharedPreferences();
              // (await _userLoginUseCase.call(
              //   UserLoginUseCaseInput(
              //     "patient@gmail.com",
              //     "123-456*",
              //   ),
              // ))
              //     .fold((l) {
              //   print(l.message.toString());
              // }, (r) {
              //   print(r.user!.email);
              //   print(r.user!.specialization);
              //   print(r.user!.numberOfRating);
              //   print(r.token);
              //   _appPreferences.setToken(r.token);
              //   // print(r.user!.scheduleTiming[0].start);
              //   print(r.user!.id);
              //   print(r.user!.type);
              // });
            },
            child: const Text(
              "Login Call",
            ),
          ),
          // TextButton(
          //   onPressed: () {
          //     _userLoginUseCase.;
          //   },
          //   child: const Text(
          //     "fold",
          //   ),
          // ),
        ],
      ),
    );
  }
}
