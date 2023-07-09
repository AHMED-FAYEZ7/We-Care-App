// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:health_care/authentication/domain/model/user_model.dart';

class BlogImage {
  String publicId;
  String imageUrl;

  BlogImage(
    this.publicId,
    this.imageUrl,
  );
}

class Blog {
  User? doctorInfo;
  String blogTitle;
  String blogDescription;
  int numComments;
  int numLikes;
  BlogImage? imageData;
  String blogId;
  String createdAt;
  String updatedAt;
  int v;

  Blog(
    this.doctorInfo,
    this.blogTitle,
    this.blogDescription,
    this.numComments,
    this.numLikes,
    this.imageData,
    this.blogId,
    this.createdAt,
    this.updatedAt,
    this.v,
  );
}

class BlogInfo {
  String message;
  Blog? blogDataInfo;
  List<Blog>? allBlogsData;

  BlogInfo(
    this.message,
    this.blogDataInfo,
    this.allBlogsData,
  );
}
