import 'package:dartz/dartz.dart';
import 'package:health_care/core/error/failure.dart';
import 'package:health_care/core/usecase/base_usecase.dart';
import 'package:health_care/doctor/domain/model/blog_model.dart';
import 'package:health_care/doctor/domain/repository/doctor_repo.dart';

class GetAllBlogsUseCase implements BaseUseCase<NoParameters, BlogInfo> {
  final BaseDoctorRepo _baseDoctorRepo;

  GetAllBlogsUseCase(this._baseDoctorRepo);

  @override
  Future<Either<Failure, BlogInfo>> call(
    NoParameters input,
  ) async {
    return await _baseDoctorRepo.getAllBlogs();
  }
}
