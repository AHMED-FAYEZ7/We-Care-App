import 'package:dartz/dartz.dart';
import 'package:health_care/core/error/failure.dart';
import 'package:health_care/core/usecase/base_usecase.dart';
import 'package:health_care/patient/domain/model/rarte_model.dart';
import 'package:health_care/patient/domain/repository/patient_repo.dart';

class GetDoctorRateUseCase implements BaseUseCase<String, RateInfo> {
  final BasePatientRepo _basePatientRepo;

  GetDoctorRateUseCase(this._basePatientRepo);

  @override
  Future<Either<Failure, RateInfo>> call(String input) async {
    return await _basePatientRepo.getDoctorReviews(doctorId: input);
  }
}
