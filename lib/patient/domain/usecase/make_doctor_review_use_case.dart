import 'package:dartz/dartz.dart';

import 'package:health_care/core/error/failure.dart';
import 'package:health_care/core/usecase/base_usecase.dart';
import 'package:health_care/patient/domain/model/rarte_model.dart';
import 'package:health_care/patient/domain/repository/patient_repo.dart';

class MakeDoctorReviewUseCase
    implements BaseUseCase<MakeRateInputUseCase, RateInfo> {
  final BasePatientRepo _basePatientRepo;

  MakeDoctorReviewUseCase(this._basePatientRepo);

  @override
  Future<Either<Failure, RateInfo>> call(
    MakeRateInputUseCase input,
  ) async {
    return await _basePatientRepo.makeDoctorReview(
      docId: input.doctorId,
      rating: input.rating,
      comment: input.comment,
    );
  }
}

class MakeRateInputUseCase {
  String doctorId;
  int rating;
  String comment;
  MakeRateInputUseCase({
    required this.doctorId,
    required this.rating,
    required this.comment,
  });
}
