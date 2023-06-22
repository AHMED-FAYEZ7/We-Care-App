import 'package:health_care/patient/data/network/patient_api/patient_api.dart';
import 'package:health_care/patient/data/response/patient_response.dart';

abstract class BasePatientRemoteDataSource {
  Future<AllDoctorsResponse> getAllDoctors();
  Future<TopDoctorsResponse> getTopDoctors();
  Future<DoctorsSpecializationResponse> doctorsSpecialization(
    String specialization,
  );
}

class PatientRemoteDataSourceImpl implements BasePatientRemoteDataSource {
  final PatientServiceClient _patientServiceClient;

  PatientRemoteDataSourceImpl(this._patientServiceClient);
  @override
  Future<AllDoctorsResponse> getAllDoctors() async {
    return await _patientServiceClient.getAllDoctors();
  }

  @override
  Future<TopDoctorsResponse> getTopDoctors() async {
    return await _patientServiceClient.getTopDoctors();
  }

  @override
  Future<DoctorsSpecializationResponse> doctorsSpecialization(
    String specialization,
  ) async {
    return await _patientServiceClient.doctorsSpecialization(specialization);
  }
}
