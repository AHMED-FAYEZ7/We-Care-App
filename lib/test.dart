import 'package:flutter/material.dart';
import 'package:health_care/authentication/domain/usecase/doctor_sinup_usecase.dart';
import 'package:health_care/authentication/domain/usecase/patient_signup_usecase.dart';
import 'package:health_care/authentication/domain/usecase/user_login_usecase.dart';
import 'package:health_care/core/services/services_locator.dart';
import 'package:health_care/patient/domain/usecase/get_all_doctors_use_case.dart';
import 'package:health_care/patient/domain/usecase/get_docotrs_specialization_use_case.dart';
import 'package:health_care/patient/domain/usecase/get_doctor_by_id_use_case.dart';
import 'package:health_care/patient/domain/usecase/get_doctor_search_use_case.dart';
import 'package:health_care/patient/domain/usecase/get_top_doctors_use_case.dart';

class TestPage extends StatelessWidget {
  TestPage({Key? key}) : super(key: key);

  final UserLoginUseCase _patientSignUpUseCase = sl<UserLoginUseCase>();
  final GetAllDoctorsUseCase _allDoctorsUseCase = sl<GetAllDoctorsUseCase>();
  final GetTopDoctorsUseCase _getTopDoctorsUseCase = sl<GetTopDoctorsUseCase>();
  final GetDoctorsSpecializationUseCase _getDoctorsSpecialization =
      sl<GetDoctorsSpecializationUseCase>();
  final GetDoctorByIdUseCase _byIdUseCase = sl<GetDoctorByIdUseCase>();
  final GetDoctorSearchUseCase _searchUseCase = sl<GetDoctorSearchUseCase>();

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
              // (await _getDoctorsSpecialization.call("heart")).fold((l) {
              //   print(l.message.toString());
              // }, (r) {
              //   print(r.results);
              //   print(r.doctorsNum);
              //   print(r.doctorsData!.length);
              //   // print(r.doctorsData![1].name);
              //   // print(r.doctorsData![2].fees);
              //   // print(r.doctorsData![4].averageRating);
              //   // print(r.doctorsData![5].timePerPatient);
              // });

              (await _byIdUseCase.call("641232eb33e617161aba77b2")).fold((l) {
                print(l.message.toString());
              }, (r) {
                print(r.user!.userName);
                print(r.user!.name);
                print(r.user!.specialization);
                print(r.user!.fees);
                print(r.user!.scheduleTiming.length);
                print("sss${r.token}");

                // print(r.doctorsData![1].name);
                // print(r.doctorsData![2].fees);
                // print(r.doctorsData![4].averageRating);
                // print(r.doctorsData![5].timePerPatient);
              });

              (await _searchUseCase.call("voltttt")).fold((l) {
                print(l.message.toString());
              }, (r) {
                print(r.allDoctorsData!.length);
                print(r.results);
                print(r.allDoctorsData![2].userName);
                print(r.allDoctorsData![3].userName);

                // print(r.doctorsData![1].name);
                // print(r.doctorsData![2].fees);
                // print(r.doctorsData![4].averageRating);
                // print(r.doctorsData![5].timePerPatient);
              });

              (await _getTopDoctorsUseCase.call("heart")).fold((l) {
                print(l.message.toString());
              }, (r) {
                print(r.results);
                print(r.allDoctorsData![0].userName);
                print(r.allDoctorsData![1].userName);
                print(r.allDoctorsData![3].userName);

                // print(r.doctorsData![1].name);
                // print(r.doctorsData![2].fees);
                // print(r.doctorsData![4].averageRating);
                // print(r.doctorsData![5].timePerPatient);
              });

              // (await _patientSignUpUseCase.call(
              //   UserLoginUseCaseInput(
              //     "doc1@gmail.com",
              //     "55555",
              //   ),
              // ))
              //     .fold((l) {
              //   print(l.message.toString());
              // }, (r) {
              //   print(r.user!.email);
              //   print(r.user!.specialization);
              //   print(r.user!.numberOfRating);
              //   print(r.user!.scheduleTiming[0].start);
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
