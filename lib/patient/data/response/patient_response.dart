import 'package:health_care/authentication/data/response/user_response/user_response.dart';
import 'package:health_care/core/response/base_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'patient_response.g.dart';

@JsonSerializable()
class AllDoctorsResponse extends BaseResponse {
  @JsonKey(name: "results")
  int? results;

  @JsonKey(name: "doctors")
  List<UserResponse>? allDoctors;

  AllDoctorsResponse(
    super.status,
    super.message,
    this.results,
    this.allDoctors,
  );

  factory AllDoctorsResponse.fromJson(Map<String, dynamic> json) =>
      _$AllDoctorsResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AllDoctorsResponseToJson(this);
}
