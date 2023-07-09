import 'package:dartz/dartz.dart';
import 'package:health_care/authentication/domain/model/patient_model.dart';
import 'package:health_care/authentication/domain/model/user_model.dart';
import 'package:health_care/core/error/failure.dart';
import 'package:health_care/core/usecase/base_usecase.dart';
import 'package:health_care/patient/domain/repository/patient_repo.dart';

class GetUserDataUseCase implements BaseUseCase<NoParameters, UserData> {
  final BasePatientRepo _basePatientRepo;

  GetUserDataUseCase(this._basePatientRepo);

  @override
  Future<Either<Failure, UserData>> call(NoParameters input) async {
    return await _basePatientRepo.getUserData();
  }
}
