import 'package:dartz/dartz.dart';
import 'package:health_care/core/error/failure.dart';
import 'package:health_care/core/usecase/base_usecase.dart';
import 'package:health_care/patient/domain/model/patient_entities.dart';
import 'package:health_care/patient/domain/repository/patient_repo.dart';

class GetDoctorSearchUseCase
    implements BaseUseCase<TwoParametersUseCase, DoctorInfo> {
  final BasePatientRepo _basePatientRepo;

  GetDoctorSearchUseCase(this._basePatientRepo);

  @override
  Future<Either<Failure, DoctorInfo>> call(TwoParametersUseCase input) async {
    return await _basePatientRepo.getDoctorSearch(
      input.firstParam,
      specialization: input.secondParam,
    );
  }
}
