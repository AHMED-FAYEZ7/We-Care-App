import 'package:health_care/authentication/data/network/patient_api/patient_api.dart';

import '../../request/patient_request.dart';
import '../../response/patient_response/patient_response.dart';

abstract class PatientRemoteDataSource {
  Future<PatientAuthResponse> patientSignUp(
      PatientSignUpRequest patientSignUpRequest);
}

class PatientRemoteDataSourceImplementer implements PatientRemoteDataSource {
  final PatientServiceClient _patientServiceClient;
  PatientRemoteDataSourceImplementer(this._patientServiceClient);

  @override
  Future<PatientAuthResponse> patientSignUp(
      PatientSignUpRequest patientSignUpRequest) async {
    return await _patientServiceClient.patientSignUp(
      patientSignUpRequest.name,
      patientSignUpRequest.password,
      patientSignUpRequest.email,
      patientSignUpRequest.passwordConfirm,
    );
  }
}
