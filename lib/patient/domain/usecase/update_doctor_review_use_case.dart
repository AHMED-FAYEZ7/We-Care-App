import 'package:dartz/dartz.dart';

import 'package:health_care/core/error/failure.dart';
import 'package:health_care/core/usecase/base_usecase.dart';
import 'package:health_care/patient/domain/model/rarte_model.dart';
import 'package:health_care/patient/domain/repository/patient_repo.dart';

class UpdateDoctorReviewUseCase
    implements BaseUseCase<UpdateDoctorReviewInputUseCase, RateInfo> {
  final BasePatientRepo _basePatientRepo;

  UpdateDoctorReviewUseCase(this._basePatientRepo);

  @override
  Future<Either<Failure, RateInfo>> call(
    UpdateDoctorReviewInputUseCase input,
  ) async {
    return await _basePatientRepo.updateDoctorReview(
      docId: input.doctorId,
      rating: input.rating,
      comment: input.comment,
    );
  }
}

class UpdateDoctorReviewInputUseCase {
  String doctorId;
  int rating;
  String comment;

  UpdateDoctorReviewInputUseCase({
    required this.doctorId,
    required this.rating,
    required this.comment,
  });
}
