import 'package:flutter/material.dart';
import 'package:health_care/authentication/domain/usecase/doctor_sinup_usecase.dart';
import 'package:health_care/authentication/domain/usecase/patient_signup_usecase.dart';
import 'package:health_care/authentication/domain/usecase/user_login_usecase.dart';
import 'package:health_care/core/app/app_prefs.dart';
import 'package:health_care/core/services/services_locator.dart';
import 'package:health_care/core/usecase/base_usecase.dart';
import 'package:health_care/doctor/domain/usecase/create_time_block_use_case.dart';
import 'package:health_care/patient/domain/usecase/book_appointment_use_case.dart';
import 'package:health_care/patient/domain/usecase/delete_review_use_case.dart';
import 'package:health_care/patient/domain/usecase/get_all_doctors_use_case.dart';
import 'package:health_care/patient/domain/usecase/get_docotrs_specialization_use_case.dart';
import 'package:health_care/patient/domain/usecase/get_doctor_by_id_use_case.dart';
import 'package:health_care/patient/domain/usecase/get_doctor_search_use_case.dart';
import 'package:health_care/patient/domain/usecase/get_my_appointments_use_case.dart';
import 'package:health_care/patient/domain/usecase/get_rate_use_case.dart';
import 'package:health_care/patient/domain/usecase/get_top_doctors_use_case.dart';
import 'package:health_care/patient/domain/usecase/make_doctor_review_use_case.dart';
import 'package:health_care/patient/domain/usecase/update_doctor_review_use_case.dart';

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
  final GetAvailableAppointmentsByDayUseCase _availableAppointmentsByDay =
      sl<GetAvailableAppointmentsByDayUseCase>();
  final BookAppointmentUseCase _bookAppointmentUseCase =
      sl<BookAppointmentUseCase>();
  final GetDoctorRateUseCase _getDoctorRateUseCase = sl<GetDoctorRateUseCase>();
  final MakeDoctorReviewUseCase _makeDoctorReviewUseCase =
      sl<MakeDoctorReviewUseCase>();
  final UpdateDoctorReviewUseCase _updateDoctorReviewUseCase =
      sl<UpdateDoctorReviewUseCase>();
  final DeleteReviewUseCase _deleteReviewUseCase = sl<DeleteReviewUseCase>();

  final CreateTimeBlockUseCase _createTimeBlockUseCase =
      sl<CreateTimeBlockUseCase>();
  final GetMyAppointmentsUseCase _getMyAppointmentsUseCase =
      sl<GetMyAppointmentsUseCase>();

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
              (await _getMyAppointmentsUseCase.call(const NoParameters())).fold(
                  (l) {
                print(l.message.toString());
              }, (r) {
                // print(r.availableAppointmentsData![0].appointmentId);
                // print(r.reviews!.length);

                print(r.upcomingAppointmentsData!.length);
                print(r.pastAppointment!.length);
                print(r.upcomingAppointmentsData![0].appointmentId);
                print(
                    r.upcomingAppointmentsData![0].doctorInfo!.profilePicture);

                // print(r.user!.specialization);
                // print(r.user!.fees);
                // print(r.user!.scheduleTiming.length);
                // print("sss${r.token}");

                // print(r.doctorsData![1].name);
                // print(r.doctorsData![2].fees);
                // print(r.doctorsData![4].averageRating);
                // print(r.doctorsData![5].timePerPatient);
              });
              // (await _createTimeBlockUseCase.call(
              //   CreateTimeBlockUseCaseInput(
              //     period: 5,
              //     startTime: "2023-10-05T01:30:00.000Z",
              //     callType: "visit",
              //   ),
              // ))
              //     .fold((l) {
              //   print(l.message.toString());
              // }, (r) {
              //   // print(r.availableAppointmentsData![0].appointmentId);
              //   // print(r.reviews!.length);

              //   print(r.period);
              //   print(r.doctorId);
              //   print(r.type);
              //   // print(r.user!.specialization);
              //   // print(r.user!.fees);
              //   // print(r.user!.scheduleTiming.length);
              //   // print("sss${r.token}");

              //   // print(r.doctorsData![1].name);
              //   // print(r.doctorsData![2].fees);
              //   // print(r.doctorsData![4].averageRating);
              //   // print(r.doctorsData![5].timePerPatient);
              // });
              // (await _deleteReviewUseCase.call("649593403f0633e0bc1cb0c8"))
              //     .fold((l) {
              //   print(l.message.toString());
              // }, (r) {
              //   // print(r.availableAppointmentsData![0].appointmentId);
              //   // print(r.reviews!.length);
              //   print(" hello  ${r.successMessage}");

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
