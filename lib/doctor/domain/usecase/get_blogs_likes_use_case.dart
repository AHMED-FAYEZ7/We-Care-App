import 'package:dartz/dartz.dart';
import 'package:health_care/core/error/failure.dart';
import 'package:health_care/core/usecase/base_usecase.dart';
import 'package:health_care/doctor/domain/model/comments_likes_model.dart';
import 'package:health_care/doctor/domain/repository/doctor_repo.dart';

class GetBlogsLikesUseCase implements BaseUseCase<String, LikesModel> {
  final BaseDoctorRepo _baseDoctorRepo;

  GetBlogsLikesUseCase(this._baseDoctorRepo);

  @override
  Future<Either<Failure, LikesModel>> call(
    String input,
  ) async {
    return await _baseDoctorRepo.getBlogsLikes(
      blogId: input,
    );
  }
}
