import 'package:dartz/dartz.dart';
import 'package:health_care/authentication/domain/model/patient_model.dart';
import 'package:health_care/authentication/domain/repository/patient_auth_repository.dart';
import 'package:health_care/core/error/failure.dart';
import 'package:health_care/core/usecase/base_usecase.dart';

import '../../data/request/patient_request.dart';

class PatientSignUpUseCase
    implements BaseUseCase<PatientSignUpUseCaseInput, PatientAuth> {
  final PatientAuthRepository _patientAuthRepository;

  PatientSignUpUseCase(this._patientAuthRepository);

  @override
  Future<Either<Failure, PatientAuth>> call(
      PatientSignUpUseCaseInput input) async {
    return await _patientAuthRepository.patientSignUp(PatientSignUpRequest(
      input.name,
      input.password,
      input.email,
      input.passwordConfirm,
    ));
  }
}

class PatientSignUpUseCaseInput {
  String name;
  String password;
  String email;
  String passwordConfirm;

  PatientSignUpUseCaseInput(
    this.name,
    this.password,
    this.email,
    this.passwordConfirm,
  );
}
