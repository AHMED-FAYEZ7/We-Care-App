// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:health_care/authentication/data/response/user_response/user_response.dart';
import 'package:health_care/core/response/base_response.dart';

part 'patient_response.g.dart';

@JsonSerializable()
class AllDoctorsResponse extends BaseResponse {
  @JsonKey(name: "results")
  int? results;

  @JsonKey(name: "doctors")
  List<UserResponse>? allDoctors;

  @JsonKey(name: 'doc')
  List<UserResponse>? doctorsSearchData;

  AllDoctorsResponse(
    super.status,
    super.message,
    this.results,
    this.allDoctors,
    this.doctorsSearchData,
  );

  factory AllDoctorsResponse.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('doctors')) {
      return _$AllDoctorsResponseFromJson(json);
    } else if (json.containsKey('doc')) {
      Map<String, dynamic> modifiedJson = {
        ...json,
        'doctors': json['doc'],
      };
      return _$AllDoctorsResponseFromJson(modifiedJson);
    } else {
      throw ArgumentError('Invalid JSON structure for AllDoctorsResponse');
    }
  }

  @override
  Map<String, dynamic> toJson() => _$AllDoctorsResponseToJson(this);
}

@JsonSerializable()
class TopDoctorsResponse extends AllDoctorsResponse {
  TopDoctorsResponse(
    super.status,
    super.message,
    super.results,
    super.allDoctors,
    super.doctorsSearchData,
  );

  factory TopDoctorsResponse.fromJson(Map<String, dynamic> json) =>
      _$TopDoctorsResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TopDoctorsResponseToJson(this);
}

// @JsonSerializable()
// class DoctorByIdResponse extends UserDataResponse {
//   @JsonKey(name: "doctor")
//   UserResponse? userResponse;

//   factory DoctorByIdResponse.fromJson(Map<String, dynamic> json) =>
//       _$DoctorByIdResponseFromJson(json);

//   @override
//   Map<String, dynamic> toJson() => _$DoctorByIdResponseToJson(this);

//   DoctorByIdResponse(
//     this.userResponse,
//   ) : super('', '', '', userResponse);
// }

@JsonSerializable()
class DoctorByIdResponse implements UserDataResponse {
  @override
  @JsonKey(name: "doctor")
  UserResponse? user;

  @override
  @JsonKey(name: "message")
  String? message;

  @override
  @JsonKey(name: "status")
  String? status;

  @override
  @JsonKey(name: "token")
  String? token;

  factory DoctorByIdResponse.fromJson(Map<String, dynamic> json) =>
      _$DoctorByIdResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$DoctorByIdResponseToJson(this);

  DoctorByIdResponse(
    this.user,
    this.message,
    this.status,
    this.token,
  );
}

@JsonSerializable()
class DoctorsSpecializationResponse extends BaseResponse {
  @JsonKey(name: "doctorsNum")
  int? doctorsNum;
  @JsonKey(name: "results")
  int? results;

  @JsonKey(name: "doctors")
  List<UserResponse>? doctorsData;

  DoctorsSpecializationResponse(
    super.status,
    super.message,
    this.doctorsNum,
    this.results,
    this.doctorsData,
  );

  factory DoctorsSpecializationResponse.fromJson(Map<String, dynamic> json) =>
      _$DoctorsSpecializationResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$DoctorsSpecializationResponseToJson(this);
}

// @JsonSerializable()
// class DoctorSearchResponse extends AllDoctorsResponse {
//   @JsonKey(name: "doc")
//   List<UserResponse>? doctorsSearchData;
//   DoctorSearchResponse(
//     this.doctorsSearchData,
//   ) : super(
//           "",
//           "",
//           0,
//           doctorsSearchData,
//           null,
//         );

//   factory DoctorSearchResponse.fromJson(Map<String, dynamic> json) =>
//       _$DoctorSearchResponseFromJson(json);

//   @override
//   Map<String, dynamic> toJson() => _$DoctorSearchResponseToJson(this);
// }

// @JsonSerializable()
// class AllDoctorsResponseTest extends BaseResponse {
//   @JsonKey(name: "results")
//   int? results;

//   List<UserResponse>? allDoctors;

//   AllDoctorsResponseTest(
//     String status,
//     String message,
//     this.results,
//     this.allDoctors,
//   ) : super(status, message);

//   factory AllDoctorsResponseTest.fromJson(Map<String, dynamic> json) {
//     if (json.containsKey('doctors')) {
//       return DocResponse.fromJson(json);
//       // return DoctorsResponse.fromJson(json);
//     } else if (json.containsKey('doc')) {
//       return DocResponse.fromJson(json);
//     } else {
//       throw ArgumentError('Invalid JSON structure for AllDoctorsResponse');
//     }
//   }

//   Map<String, dynamic> toJson() => _$AllDoctorsResponseToJson(this);
// }

// @JsonSerializable()
// class DocResponse extends AllDoctorsResponseTest {
//   DocResponse(
//     String status,
//     String message,
//     int? results,
//     List<UserResponse>? allDoctors,
//   ) : super(status, message, results, allDoctors);

//   factory DocResponse.fromJson(Map<String, dynamic> json) =>
//       _$DocResponseFromJson(json);

//   @override
//   @JsonKey(name: "doc")
//   List<UserResponse>? allDoctors;
// }
