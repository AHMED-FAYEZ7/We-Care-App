import 'package:health_care/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:health_care/core/usecase/base_usecase.dart';
import 'package:health_care/patient/domain/model/patient_entities.dart';
import 'package:health_care/patient/domain/repository/patient_repo.dart';

class GetAllDoctorsUseCase implements BaseUseCase<String, AllDoctors> {
  final BasePatientRepo _basePatientRepo;

  GetAllDoctorsUseCase(this._basePatientRepo);

  @override
  Future<Either<Failure, AllDoctors>> call(String input) async {
    return await _basePatientRepo.getAllDoctors();
  }
}
