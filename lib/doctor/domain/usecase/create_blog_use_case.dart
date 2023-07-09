import 'package:dartz/dartz.dart';
import 'package:health_care/core/error/failure.dart';
import 'package:health_care/core/usecase/base_usecase.dart';
import 'package:health_care/doctor/domain/model/blog_model.dart';
import 'package:health_care/doctor/domain/repository/doctor_repo.dart';

class CreateBlogUseCase
    implements BaseUseCase<CreateBlogUseCaseInput, BlogInfo> {
  final BaseDoctorRepo _baseDoctorRepo;

  CreateBlogUseCase(this._baseDoctorRepo);

  @override
  Future<Either<Failure, BlogInfo>> call(
    CreateBlogUseCaseInput input,
  ) async {
    return await _baseDoctorRepo.createBlog(
      input.postDescription,
      input.postTitle,
      blogImage: input.postImage,
    );
  }
}

class CreateBlogUseCaseInput {
  String postDescription;
  String postTitle;
  String? postImage;

  CreateBlogUseCaseInput({
    required this.postDescription,
    required this.postTitle,
    this.postImage,
  });
}
