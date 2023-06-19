import 'package:health_care/authentication/data/network/patient_auth_api/patient_auth_api.dart';
import 'package:health_care/authentication/data/response/patient_auth_response/patient_auth_response.dart';

import '../../request/patient_request.dart';

abstract class PatientAuthRemoteDataSource {
  Future<PatientAuthResponse> patientSignUp(
    PatientSignUpRequest patientSignUpRequest,
  );
}

class PatientAuthRemoteDataSourceImplementer
    implements PatientAuthRemoteDataSource {
  final PatientAuthServiceClient _patientAuthServiceClient;
  PatientAuthRemoteDataSourceImplementer(this._patientAuthServiceClient);

  @override
  Future<PatientAuthResponse> patientSignUp(
    PatientSignUpRequest patientSignUpRequest,
  ) async {
    return await _patientAuthServiceClient.patientSignUp(
      patientSignUpRequest.name,
      patientSignUpRequest.password,
      patientSignUpRequest.email,
      patientSignUpRequest.passwordConfirm,
    );
  }
}
