import 'package:dartz/dartz.dart';
import 'package:health_care/core/error/failure.dart';
import 'package:health_care/core/usecase/base_usecase.dart';
import 'package:health_care/doctor/domain/model/blog_model.dart';
import 'package:health_care/doctor/domain/repository/doctor_repo.dart';

class GetDoctorBlogsById implements BaseUseCase<String, BlogInfo> {
  final BaseDoctorRepo _baseDoctorRepo;

  GetDoctorBlogsById(this._baseDoctorRepo);

  @override
  Future<Either<Failure, BlogInfo>> call(
    String input,
  ) async {
    return await _baseDoctorRepo.getDoctorBlogsById(
      doctorId: input,
    );
  }
}
