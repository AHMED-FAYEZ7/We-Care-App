import 'package:health_care/core/response/base_response.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:health_care/authentication/data/response/user_response/user_response.dart';

part 'blog_response.g.dart';

@JsonSerializable()
class ImageResponse {
  @JsonKey(name: "public_id")
  String? publicId;

  @JsonKey(name: "url")
  String? imageUrl;

  ImageResponse(
    this.publicId,
    this.imageUrl,
  );

  factory ImageResponse.fromJson(Map<String, dynamic> json) =>
      _$ImageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ImageResponseToJson(this);
}

@JsonSerializable()
class BlogResponse {
  @JsonKey(name: "user")
  UserResponse? doctorInfo;

  @JsonKey(name: "title")
  String? blogTitle;

  @JsonKey(name: "des")
  String? blogDescription;

  @JsonKey(name: "numComments")
  int? numComments;

  @JsonKey(name: "numLikes")
  int? numLikes;

  @JsonKey(name: "image")
  ImageResponse? image;

  @JsonKey(name: "_id")
  String? blogId;

  @JsonKey(name: "createdAt")
  String? createdAt;

  @JsonKey(name: "updatedAt")
  String? updatedAt;

  @JsonKey(name: "__v")
  int? v;

  BlogResponse(
    this.doctorInfo,
    this.blogTitle,
    this.blogDescription,
    this.numComments,
    this.numLikes,
    this.image,
    this.blogId,
    this.createdAt,
    this.updatedAt,
    this.v,
  );

  factory BlogResponse.fromJson(Map<String, dynamic> json) =>
      _$BlogResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BlogResponseToJson(this);
}

@JsonSerializable()
class BlogInfoResponse extends BaseResponse {
  @JsonKey(name: "Blog")
  BlogResponse? blogResponseData;
  @JsonKey(name: "Blogs")
  List<BlogResponse>? allBlogsResponse;

  BlogInfoResponse(
    super.status,
    super.message,
    this.blogResponseData,
    this.allBlogsResponse,
  );

  factory BlogInfoResponse.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('Blog')) {
      return _$BlogInfoResponseFromJson(json);
    } else if (json.containsKey('Blogs')) {
      return _$BlogInfoResponseFromJson(json);
    } else {
      throw ArgumentError('Invalid JSON structure for AllDoctorsResponse');
    }
  }

  @override
  Map<String, dynamic> toJson() => _$BlogInfoResponseToJson(this);
}
