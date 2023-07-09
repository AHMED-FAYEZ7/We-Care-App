import 'package:dartz/dartz.dart';
import 'package:health_care/core/error/failure.dart';
import 'package:health_care/core/usecase/base_usecase.dart';
import 'package:health_care/doctor/domain/model/comments_likes_model.dart';
import 'package:health_care/doctor/domain/repository/doctor_repo.dart';

class GetBlogsCommentsUseCase implements BaseUseCase<String, CommentInfo> {
  final BaseDoctorRepo _baseDoctorRepo;

  GetBlogsCommentsUseCase(this._baseDoctorRepo);

  @override
  Future<Either<Failure, CommentInfo>> call(
    String input,
  ) async {
    return await _baseDoctorRepo.getBlogsComments(
      blogId: input,
    );
  }
}
