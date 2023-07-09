import 'package:json_annotation/json_annotation.dart';

part 'time_block_response.g.dart';

@JsonSerializable()
class TimeBlockResponse {
  @JsonKey(name: "period")
  int? period;

  @JsonKey(name: "startTime")
  String? startTime;

  @JsonKey(name: "type")
  String? type;

  @JsonKey(name: "_id")
  String? timeBlockId;

  @JsonKey(name: "doctor")
  String? doctorId;

  @JsonKey(name: "__v")
  int? v;

  TimeBlockResponse(
    this.period,
    this.startTime,
    this.type,
    this.timeBlockId,
    this.doctorId,
    this.v,
  );

  factory TimeBlockResponse.fromJson(Map<String, dynamic> json) =>
      _$TimeBlockResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TimeBlockResponseToJson(this);
}
