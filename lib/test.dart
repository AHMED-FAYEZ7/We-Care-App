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
              // (await _bookAppointmentUseCase.call("6491b4946c272fc553e0292d"))
              //     .fold((l) {
              //   print(l.message.toString());
              // }, (r) {
              //   // print(r.availableAppointmentsData![0].appointmentId);
              //   print(r.availableAppointmentsData!.length);
              //   print(r.availableAppointmentsByDayData!.length);
              //   print(r.bookedAppointmentData!.appointmentId);
              //   print(r.bookedAppointmentData!.date);
              //   print(r.bookedAppointmentData!.doctorId);
              //   print(r.bookedAppointmentData!.patientId);
              //   // print(r.user!.name);
              //   // print(r.user!.specialization);
              //   // print(r.user!.fees);
              //   // print(r.user!.scheduleTiming.length);
              //   // print("sss${r.token}");

              //   // print(r.doctorsData![1].name);
              //   // print(r.doctorsData![2].fees);
              //   // print(r.doctorsData![4].averageRating);
              //   // print(r.doctorsData![5].timePerPatient);
              // });
              (await _getDoctorRateUseCase.call("649593403f0633e0bc1cb0c8"))
                  .fold((l) {
                print(l.message.toString());
              }, (r) {
                // print(r.availableAppointmentsData![0].appointmentId);
                print(r.reviews!.length);
                print(r.reviews![0].comment);
                print(r.reviews![0].rating);
                print(r.reviews![0].patient!.name);
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
              // (await _availableAppointmentsByDay.call(
              //   TwoParametersUseCase(
              //     "6491a45e0781cc8fbabc0035",
              //     "2023-10-05",
              //   ),
              // ))
              //     .fold((l) {
              //   print(l.message.toString());
              // }, (r) {
              //   // print(r.availableAppointmentsByDayData![0].appointmentId);
              //   print(r.availableAppointmentsData!.length);
              //   // print(r.);
              //   print(r.availableAppointmentsByDayData!.length);
              //   // print(r.user!.name);
              //   // print(r.user!.specialization);
              //   // print(r.user!.fees);
              //   // print(r.user!.scheduleTiming.length);
              //   // print("sss${r.token}");

              //   // print(r.doctorsData![1].name);
              //   // print(r.doctorsData![2].fees);
              //   // print(r.doctorsData![4].averageRating);
              //   // print(r.doctorsData![5].timePerPatient);
              // });
              // // String token = await _appPreferences.getToken();
              // // print(token);
              // (await _searchUseCase.call(
              //   TwoParametersUseCase(
              //     "",
              //     "Heart",
              //   ),
              // ))
              //     .fold((l) {
              //   print(l.message.toString());
              // }, (r) {
              //   print("results:${r.results}");
              //   print("allDoctorsData:${r.allDoctorsData!.length}");
              //   print("topDoctorsData:${r.topDoctorsData!.length}");
              //   print("doctorsSearchData: ${r.doctorsSearchData!.length}");
              //   print(
              //       "doctorsSpecializationData: ${r.doctorsSpecializationData!.length}");

              //   // print(r.results);
              //   print(r.doctorsSearchData![0].userName);
              //   // print(r.doctorsSearchData![2].userName);
              //   // print(r.doctorsSearchData![3].userName);

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
