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
  Future<DoctorInfResponse> getDoctorSearch(String query);
  Future<AppointmentInfoResponse> getDoctorAvailableAppointments(String docId);
  Future<AppointmentInfoResponse> getAvailableAppointmentsByDay(
    String docId,
    String date,
  );
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
  Future<DoctorInfResponse> getDoctorSearch(String query) async {
    return await _patientServiceClient.getDoctorSearch(query);
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
    final data = await _patientServiceClient.getAvailableAppointmentsByDay(
      docId,
      date,
    );
    print(
        " sssssssssssssnnnnnnnnnn${data.availableAppointmentsByDayResponseData![0].paid}");
    print(
        " sssssssssssssnnnnnnnnnn${data.availableAppointmentsByDayResponseData![0].appointmentId}");
    print(
        " sssssssssssssnnnnnnnnnn${data.availableAppointmentsByDayResponseData![0].type}");
    print(
        " sssssssssssssnnnnnnnnnn${data.availableAppointmentsByDayResponseData![0].status}");
    print(
        " sssssssssssssnnnnnnnnnn${data.availableAppointmentsByDayResponseData![0].doctorId}");
    print(
        " sssssssssssssnnnnnnnnnn${data.availableAppointmentsByDayResponseData![0].patientId}");
    print(
        " sssssssssssssnnnnnnnnnn${data.availableAppointmentsByDayResponseData![0].date}");
    print(
        " sssssssssssssnnnnnnnnnn${data.availableAppointmentsByDayResponseData![0].v}");
    print(
        " sssssssssssssnnnnnnnnnn${data.availableAppointmentsByDayResponseData![0].price}");
    return data;
  }
}
