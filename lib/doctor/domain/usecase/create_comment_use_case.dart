import 'package:dartz/dartz.dart';
import 'package:health_care/core/error/failure.dart';
import 'package:health_care/core/usecase/base_usecase.dart';
import 'package:health_care/doctor/domain/model/comments_likes_model.dart';
import 'package:health_care/doctor/domain/repository/doctor_repo.dart';

class CreateCommentUseCase
    implements BaseUseCase<CreateCommentUseCaseInput, CommentInfo> {
  final BaseDoctorRepo _baseDoctorRepo;

  CreateCommentUseCase(this._baseDoctorRepo);

  @override
  Future<Either<Failure, CommentInfo>> call(
    CreateCommentUseCaseInput input,
  ) async {
    return await _baseDoctorRepo.createComment(
      blogId: input.blogId,
      commentContent: input.commentContent,
    );
  }
}

class CreateCommentUseCaseInput {
  String blogId;
  String commentContent;

  CreateCommentUseCaseInput({
    required this.blogId,
    required this.commentContent,
  });
}
