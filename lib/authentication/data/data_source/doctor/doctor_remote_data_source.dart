import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:health_care/authentication/data/network/doctor_api/doctor_api.dart';
import 'package:health_care/authentication/data/request/doctor_request.dart';
import 'package:health_care/authentication/data/response/doctor_repo/doctor_response.dart';
import 'package:health_care/core/error/error_handler.dart';
import 'package:health_care/core/error/exceptions.dart';
import 'package:health_care/core/network/error_message_model.dart';

abstract class BaseDoctorRemoteDataSource {
  Future<DoctorAuthResponse> doctorSignUp(
    DoctorSignUpRequest doctorSignUpRequest,
  );
}

class DoctorRemoteDataSourceImpl implements BaseDoctorRemoteDataSource {
  final DoctorServiceClient doctorServiceClient;

  DoctorRemoteDataSourceImpl(this.doctorServiceClient);
  @override
  Future<DoctorAuthResponse> doctorSignUp(
    DoctorSignUpRequest doctorSignUpRequest,
  ) async {
    return await doctorServiceClient.doctorSignUp(
      doctorSignUpRequest.name,
      doctorSignUpRequest.specialization,
      doctorSignUpRequest.password,
      doctorSignUpRequest.passwordConfirm,
      doctorSignUpRequest.email,
    );
  }
  // using http package
  // Future<String> test2() async {
  //   var body = jsonEncode({
  //     "name": "volr",
  //     "specialization": "heart",
  //     "password": "123456",
  //     "passwordConfirm": "123456",
  //     "email": "volt7399997200@gmail.com",
  //   });

  //   final uri =
  //       Uri.parse("https://helth-clinc.onrender.com/api/v1/doctors/sig");
  //   final response = await http.post(uri, body: body, headers: {
  //     'Content-Type': 'application/json',
  //   });
  //   if (response.statusCode == 200) {
  //     print(response.body);
  //     print(response.statusCode);
  //     print(response.request);
  //     return "success";
  //   } else if (response.statusCode == 404) {
  //     print(response.body);
  //     print(response.statusCode);
  //     print(response.request);
  //     return "success but fail";
  //   } else {
  //     return "fail";
  //   }
  // }

}
