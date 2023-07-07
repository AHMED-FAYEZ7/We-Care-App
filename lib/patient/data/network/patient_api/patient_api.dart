import 'package:dio/dio.dart';
import 'package:health_care/authentication/data/response/patient_auth_response/patient_auth_response.dart';
import 'package:health_care/authentication/data/response/user_response/user_response.dart';
import 'package:health_care/core/network/api_constance.dart';
import 'package:health_care/patient/data/response/appointments_response.dart';
import 'package:health_care/patient/data/response/patient_response.dart';
import 'package:health_care/patient/data/response/rate_response.dart';
import 'package:retrofit/retrofit.dart';

part 'patient_api.g.dart';

@RestApi(baseUrl: AppConstance.baseUrl)
abstract class PatientServiceClient {
  factory PatientServiceClient(Dio dio, {String baseUrl}) =
      _PatientServiceClient;

  @GET("api/v1/doctors")
  Future<DoctorInfResponse> getAllDoctors();

  @GET("api/v1/doctors/topdoctors")
  Future<DoctorInfResponse> getTopDoctors({
    @Query("specialization") String? specialization,
  });

  @GET("api/v1/doctors/specialization/{specialization}")
  Future<DoctorInfResponse> getDoctorsBySpecialization(
    @Path("specialization") String specialization,
  );

  @GET("api/v1/doctors/{id}")
  Future<DoctorByIdResponse> getDoctorById(
    @Path("id") String id,
  );

  @GET("api/v1/doctors/search")
  Future<DoctorInfResponse> getDoctorSearch(
    @Query("keyword") String query, {
    @Query("specialization") String? specialization,
  });

  @GET("api/v1/patients/mydata")
  Future<PatientAuthResponse> getPatientData();

  ////////////// Appointment ////////////////

  @GET("api/v1/appointments/available/{docId}")
  Future<AppointmentInfoResponse> getDoctorAvailableAppointments(
    @Path("docId") String docId,
  );

  @GET("api/v1/appointments/availableByday/{docId}")
  Future<AppointmentInfoResponse> getAvailableAppointmentsByDay(
    @Path("docId") String docId,
    @Field("day") String date,
  );

  @GET("api/v1/appointments")
  Future<AppointmentInfoResponse> getMyAppointments();

  @POST("api/v1/appointments/book")
  Future<AppointmentInfoResponse> bookAppointment(
    @Field("AppointmentID") String appointmentID,
  );

//////////////////// reviews ////////////

  @GET("api/v1/reviews/doctor/{docId}")
  Future<RateInfoResponse> getDoctorReviews(
    @Path("docId") String docId,
  );

  @POST("api/v1/reviews/{docId}")
  Future<RateInfoResponse> makeReview(
    @Path("docId") String docId,
    @Field("rating") int rating,
    @Field("comment") String comment,
  );

  @PATCH("api/v1/reviews/{docId}")
  Future<RateInfoResponse> updateReview(
    @Path("docId") String docId,
    @Field("rating") int rating,
    @Field("comment") String comment,
  );

  @DELETE("api/v1/reviews/{docId}")
  Future<RateInfoResponse> deleteReview(
    @Path("docId") String docId,
  );
}
