import 'package:health_care/authentication/data/response/user_response/user_response.dart';
import 'package:health_care/patient/data/network/patient_api/patient_api.dart';
import 'package:health_care/patient/data/response/patient_response.dart';

abstract class BasePatientRemoteDataSource {
  Future<AllDoctorsResponse> getAllDoctors();
  Future<TopDoctorsResponse> getTopDoctors();
  Future<DoctorsSpecializationResponse> getDoctorsBySpecialization(
    String specialization,
  );
  Future<DoctorByIdResponse> getDoctorById(String id);
  Future<AllDoctorsResponse> getDoctorSearch(String query);
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
  Future<DoctorsSpecializationResponse> getDoctorsBySpecialization(
    String specialization,
  ) async {
    return await _patientServiceClient.getDoctorsBySpecialization(
      specialization,
    );
  }

  @override
  Future<DoctorByIdResponse> getDoctorById(String id) async {
    return await _patientServiceClient.getDoctorById(id);
  }

  @override
  Future<AllDoctorsResponse> getDoctorSearch(String query) async {
    return await _patientServiceClient.getDoctorSearch(query);
  }
}
