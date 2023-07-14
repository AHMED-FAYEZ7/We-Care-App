import 'package:health_care/authentication/data/response/user_response/user_response.dart';
import 'package:health_care/patient/data/network/patient_api/patient_api.dart';
import 'package:health_care/patient/data/response/appointments_response.dart';
import 'package:health_care/patient/data/response/patient_response.dart';
import 'package:health_care/patient/data/response/payment_response.dart';
import 'package:health_care/patient/data/response/rate_response.dart';

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

  Future<UserDataResponse> getUserData();

  ///////////////// appointment ////////////////

  Future<AvailableAppointmentsResponse> getDoctorAvailableAppointments(
    String docId,
  );

  Future<AvailableAppointmentsResponse> getAvailableAppointmentsByDay({
    required String docId,
    required String dayDate,
    String? visitType,
  });

  Future<MyAppointmentsResponse> getMyAppointments();

  Future<BookedAppointmentResponse> bookAppointment({
    required String appointmentID,
    String? comment,
  });

  ///////////////// reviews ////////////////

  Future<RateInfoResponse> getDoctorReviews({
    required String docId,
  });

  Future<RateInfoResponse> makeDoctorReview({
    required String docId,
    required int rating,
    required String comment,
  });

  Future<RateInfoResponse> updateDoctorReview({
    required String docId,
    required int rating,
    required String comment,
  });

  Future<RateInfoResponse> deleteReview({required String docId});

  ///////////////// Payment ////////////////

  Future<SessionResponse> openStripeSession({required String appointmentId});
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
  Future<UserDataResponse> getUserData() async {
    return await _patientServiceClient.getUserData();
  }

  @override
  Future<AvailableAppointmentsResponse> getDoctorAvailableAppointments(
    String docId,
  ) async {
    return await _patientServiceClient.getDoctorAvailableAppointments(docId);
  }

  @override
  Future<AvailableAppointmentsResponse> getAvailableAppointmentsByDay({
    required String docId,
    required String dayDate,
    String? visitType,
  }) async {
    return await _patientServiceClient.getAvailableAppointmentsByDay(
      docId,
      dayDate,
      visitType: visitType,
    );
  }

  @override
  Future<MyAppointmentsResponse> getMyAppointments() async {
    return await _patientServiceClient.getMyAppointments();
  }

  @override
  Future<BookedAppointmentResponse> bookAppointment({
    required String appointmentID,
    String? comment,
  }) async {
    return await _patientServiceClient.bookAppointment(
      appointmentID,
      comment: comment,
    );
  }

  @override
  Future<RateInfoResponse> getDoctorReviews({required String docId}) async {
    return await _patientServiceClient.getDoctorReviews(
      docId,
    );
  }

  @override
  Future<RateInfoResponse> makeDoctorReview({
    required String docId,
    required int rating,
    required String comment,
  }) async {
    return await _patientServiceClient.makeReview(
      docId,
      rating,
      comment,
    );
  }

  @override
  Future<RateInfoResponse> updateDoctorReview({
    required String docId,
    required int rating,
    required String comment,
  }) async {
    return await _patientServiceClient.updateReview(
      docId,
      rating,
      comment,
    );
  }

  @override
  Future<RateInfoResponse> deleteReview({required String docId}) async {
    return await _patientServiceClient.deleteReview(
      docId,
    );
  }

  @override
  Future<SessionResponse> openStripeSession({
    required String appointmentId,
  }) async {
    return await _patientServiceClient.openStripeSession(
      appointmentId,
    );
  }
}
