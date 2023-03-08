import 'package:dartz/dartz.dart';
import 'package:health_care/authentication/data/request/doctor_request.dart';
import 'package:health_care/authentication/domain/model/doctor_model.dart';
import 'package:health_care/authentication/domain/repository/doctor_auth_repository.dart';
import 'package:health_care/core/error/failure.dart';
import 'package:health_care/core/usecase/base_usecase.dart';

class DoctorSignUpUseCase
    implements BaseUseCase<DoctorSignUpUseCaseInput, DoctorAuth> {
  final BaseDoctorAuthRepository baseDoctorAuthRepository;

  DoctorSignUpUseCase(this.baseDoctorAuthRepository);
  @override
  Future<Either<Failure, DoctorAuth>> call(
    DoctorSignUpUseCaseInput input,
  ) async {
    return await baseDoctorAuthRepository.doctorSignUp(
      DoctorSignUpRequest(
        input.email,
        input.name,
        input.password,
        input.passwordConfirm,
        input.specialization,
      ),
    );
  }
}

class DoctorSignUpUseCaseInput {
  String name;
  String password;
  String email;
  String passwordConfirm;
  String specialization;

  DoctorSignUpUseCaseInput(
    this.name,
    this.password,
    this.email,
    this.passwordConfirm,
    this.specialization,
  );
}
