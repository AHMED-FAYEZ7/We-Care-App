// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageResponse _$ImageResponseFromJson(Map<String, dynamic> json) =>
    ImageResponse(
      json['public_id'] as String?,
      json['url'] as String?,
    );

Map<String, dynamic> _$ImageResponseToJson(ImageResponse instance) =>
    <String, dynamic>{
      'public_id': instance.publicId,
      'url': instance.imageUrl,
    };

BlogResponse _$BlogResponseFromJson(Map<String, dynamic> json) => BlogResponse(
      json['user'] == null
          ? null
          : UserResponse.fromJson(json['user'] as Map<String, dynamic>),
      json['title'] as String?,
      json['des'] as String?,
      json['numComments'] as int?,
      json['numLikes'] as int?,
      json['image'] == null
          ? null
          : ImageResponse.fromJson(json['image'] as Map<String, dynamic>),
      json['_id'] as String?,
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
      json['__v'] as int?,
    );

Map<String, dynamic> _$BlogResponseToJson(BlogResponse instance) =>
    <String, dynamic>{
      'user': instance.doctorInfo,
      'title': instance.blogTitle,
      'des': instance.blogDescription,
      'numComments': instance.numComments,
      'numLikes': instance.numLikes,
      'image': instance.image,
      '_id': instance.blogId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.v,
    };

BlogInfoResponse _$BlogInfoResponseFromJson(Map<String, dynamic> json) =>
    BlogInfoResponse(
      json['status'] as String?,
      json['message'] as String?,
      json['Blog'] == null
          ? null
          : BlogResponse.fromJson(json['Blog'] as Map<String, dynamic>),
      (json['Blogs'] as List<dynamic>?)
          ?.map((e) => BlogResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BlogInfoResponseToJson(BlogInfoResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'Blog': instance.blogResponseData,
      'Blogs': instance.allBlogsResponse,
    };
