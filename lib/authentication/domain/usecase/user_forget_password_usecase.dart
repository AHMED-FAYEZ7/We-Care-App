import 'package:dartz/dartz.dart';
import 'package:health_care/authentication/data/request/user_request.dart';
import 'package:health_care/authentication/domain/model/user_model.dart';
import 'package:health_care/authentication/domain/repository/user_repository.dart';
import 'package:health_care/core/error/failure.dart';
import 'package:health_care/core/usecase/base_usecase.dart';

class UserForgetPasswordUseCase
    extends BaseUseCase<String, UserForgetPassword> {
  final BaseUserRepository _baseUserRepository;

  UserForgetPasswordUseCase(
    this._baseUserRepository,
  );

  @override
  Future<Either<Failure, UserForgetPassword>> call(String input) async {
    return await _baseUserRepository.userForgetPassword(
      UserForgetPasswordRequest(
        input,
      ),
    );
  }
}
