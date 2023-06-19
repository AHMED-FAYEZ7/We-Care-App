import 'package:health_care/authentication/data/network/doctor_auth_api/doctor_auth_api.dart';
import 'package:health_care/authentication/data/request/doctor_request.dart';
import 'package:health_care/authentication/data/response/doctor_auth_response/doctor_auth_response.dart';

abstract class BaseDoctorAuthRemoteDataSource {
  Future<DoctorAuthResponse> doctorSignUp(
    DoctorSignUpRequest doctorSignUpRequest,
  );
}

class DoctorAuthRemoteDataSourceImpl implements BaseDoctorAuthRemoteDataSource {
  final DoctorAuthServiceClient _doctorAuthServiceClient;

  DoctorAuthRemoteDataSourceImpl(this._doctorAuthServiceClient);
  @override
  Future<DoctorAuthResponse> doctorSignUp(
    DoctorSignUpRequest doctorSignUpRequest,
  ) async {
    return await _doctorAuthServiceClient.doctorSignUp(
      doctorSignUpRequest.name,
      doctorSignUpRequest.specialization,
      doctorSignUpRequest.password,
      doctorSignUpRequest.passwordConfirm,
      doctorSignUpRequest.email,
    );
  }
}
