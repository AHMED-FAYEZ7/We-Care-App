import 'package:dartz/dartz.dart';
import 'package:health_care/core/error/failure.dart';
import 'package:health_care/core/usecase/base_usecase.dart';
import 'package:health_care/doctor/domain/repository/doctor_repo.dart';

class CreateDisLikeUseCase implements BaseUseCase<String, String> {
  final BaseDoctorRepo _baseDoctorRepo;

  CreateDisLikeUseCase(this._baseDoctorRepo);

  @override
  Future<Either<Failure, String>> call(
    String input,
  ) async {
    return await _baseDoctorRepo.createDisLike(blogId: input);
  }
}
