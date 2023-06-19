// // ignore_for_file: depend_on_referenced_packages

// import 'package:health_care/authentication/data/response/user_response/user_response.dart';
// import 'package:json_annotation/json_annotation.dart';

// import '../../../../core/response/base_response.dart';

// part 'patient_response.g.dart';

// @JsonSerializable()
// class PatientAuthResponse extends BaseResponse {
//   @JsonKey(name: "token")
//   String? token;
//   @JsonKey(name: "user")
//   UserResponse? user;

//   PatientAuthResponse(
//     super.status,
//     super.message,
//     this.token,
//     this.user,
//   );

//   factory PatientAuthResponse.fromJson(Map<String, dynamic> json) =>
//       _$PatientAuthResponseFromJson(json);

//   @override
//   Map<String, dynamic> toJson() => _$PatientAuthResponseToJson(this);
// }
