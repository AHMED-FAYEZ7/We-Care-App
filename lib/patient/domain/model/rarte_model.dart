import 'package:health_care/authentication/domain/model/user_model.dart';

class Rate {
  String reviewId;
  int rating;
  String comment;
  String createdAt;
  String updatedAt;
  int v;
  User? patient;
  User? doctor;

  Rate(
    this.reviewId,
    this.rating,
    this.comment,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.patient,
    this.doctor,
  );
}

class RateInfo {
  int reviewsNum;
  int results;
  List<Rate>? reviews;

  RateInfo(
    this.reviewsNum,
    this.results,
    this.reviews,
  );
}
