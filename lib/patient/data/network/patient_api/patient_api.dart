// import 'package:dio/dio.dart';
// import 'package:health_care/core/network/api_constance.dart';
// import 'package:retrofit/retrofit.dart';
// import '../../response/patient_response/patient_response.dart';

// part 'patient_api.g.dart';

// @RestApi(baseUrl: AppConstance.baseUrl)
// abstract class PatientServiceClient {
//   factory PatientServiceClient(Dio dio, {String baseUrl}) =
//       _PatientServiceClient;

//   @POST("api/v1/patients/signup")
//   Future<PatientAuthResponse> patientSignUp(
//     @Field("name") String name,
//     @Field("password") String password,
//     @Field("email") String email,
//     @Field("passwordConfirm") String passwordConfirm,
//   );
// }
