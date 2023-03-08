import 'package:dartz/dartz.dart';
import 'package:health_care/authentication/data/request/doctor_request.dart';
import 'package:health_care/authentication/domain/model/doctor_model.dart';
import 'package:health_care/core/error/failure.dart';

abstract class BaseDoctorAuthRepository {
  Future<Either<Failure, DoctorAuth>> doctorSignUp(
    DoctorSignUpRequest doctorSignUpRequest,
  );
}
