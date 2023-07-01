import 'package:health_care/authentication/data/response/user_response/user_response.dart';
import 'package:health_care/core/response/base_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rate_response.g.dart';

@JsonSerializable()
class RateResponse {
  @JsonKey(name: "_id")
  String? reviewId;
  @JsonKey(name: "rating")
  int? rating;

  @JsonKey(name: "comment")
  String? comment;

  @JsonKey(name: "createdAt")
  String? createdAt;

  @JsonKey(name: "updatedAt")
  String? updatedAt;

  @JsonKey(name: "__v")
  int? v;

  @JsonKey(name: "patient")
  UserResponse? patient;

  @JsonKey(name: "doctor")
  UserResponse? doctor;

  RateResponse(
    this.reviewId,
    this.rating,
    this.comment,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.patient,
    this.doctor,
  );

  factory RateResponse.fromJson(Map<String, dynamic> json) =>
      _$RateResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RateResponseToJson(this);
}

@JsonSerializable()
class RateInfoResponse extends BaseResponse {
  @JsonKey(name: "reviewsNum")
  int? reviewsNum;

  @JsonKey(name: "results")
  int? results;

  @JsonKey(name: "msg")
  String? successMessage;

  @JsonKey(name: "reviews")
  List<RateResponse>? reviews;

  RateInfoResponse(
    super.status,
    super.message,
    this.reviewsNum,
    this.results,
    this.successMessage,
    this.reviews,
  );

  factory RateInfoResponse.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('reviews')) {
      return _$RateInfoResponseFromJson(json);
    } else if (json.containsKey('msg')) {
      return _$RateInfoResponseFromJson(json);
    } else {
      throw ArgumentError('Invalid JSON structure for AllDoctorsResponse');
    }
  }

  @override
  Map<String, dynamic> toJson() => _$RateInfoResponseToJson(this);
}
