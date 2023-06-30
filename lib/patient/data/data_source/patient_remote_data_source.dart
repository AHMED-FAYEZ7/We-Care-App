import 'package:health_care/patient/data/network/patient_api/patient_api.dart';
import 'package:health_care/patient/data/response/appointments_response.dart';
import 'package:health_care/patient/data/response/patient_response.dart';

abstract class BasePatientRemoteDataSource {
  Future<DoctorInfResponse> getAllDoctors();
  Future<DoctorInfResponse> getTopDoctors({String? specialization});
  Future<DoctorInfResponse> getDoctorsBySpecialization(
    String specialization,
  );
  Future<DoctorByIdResponse> getDoctorById(String id);
  Future<DoctorInfResponse> getDoctorSearch(
    String query, {
    String? specialization,
  });
  Future<AppointmentInfoResponse> getDoctorAvailableAppointments(String docId);
  Future<AppointmentInfoResponse> getAvailableAppointmentsByDay(
    String docId,
    String date,
  );

  Future<AppointmentInfoResponse> bookAppointment({
    required String appointmentID,
  });
}

class PatientRemoteDataSourceImpl implements BasePatientRemoteDataSource {
  final PatientServiceClient _patientServiceClient;

  PatientRemoteDataSourceImpl(this._patientServiceClient);
  @override
  Future<DoctorInfResponse> getAllDoctors() async {
    return await _patientServiceClient.getAllDoctors();
  }

  @override
  Future<DoctorInfResponse> getTopDoctors({String? specialization}) async {
    return await _patientServiceClient.getTopDoctors(
      specialization: specialization,
    );
  }

  @override
  Future<DoctorInfResponse> getDoctorsBySpecialization(
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
  Future<DoctorInfResponse> getDoctorSearch(
    String query, {
    String? specialization,
  }) async {
    return await _patientServiceClient.getDoctorSearch(
      query,
      specialization: specialization,
    );
  }

  @override
  Future<AppointmentInfoResponse> getDoctorAvailableAppointments(
    String docId,
  ) async {
    return await _patientServiceClient.getDoctorAvailableAppointments(docId);
  }

  @override
  Future<AppointmentInfoResponse> getAvailableAppointmentsByDay(
    String docId,
    String date,
  ) async {
    return await _patientServiceClient.getAvailableAppointmentsByDay(
      docId,
      date,
    );
  }

  @override
  Future<AppointmentInfoResponse> bookAppointment({
    required String appointmentID,
  }) async {
    return await _patientServiceClient.bookAppointment(
      appointmentID,
    );
  }
}
