import 'package:dartz/dartz.dart';
import 'package:health_care/authentication/data/request/user_request.dart';
import 'package:health_care/authentication/domain/model/user_model.dart';
import 'package:health_care/authentication/domain/repository/user_repository.dart';
import 'package:health_care/core/error/failure.dart';
import 'package:health_care/core/usecase/base_usecase.dart';

class UserLoginUseCase implements BaseUseCase<UserLoginUseCaseInput, UserData> {
  final BaseUserRepository _baseUserRepository;
  UserLoginUseCase(
    this._baseUserRepository,
  );
  @override
  Future<Either<Failure, UserData>> call(UserLoginUseCaseInput input) async {
    return await _baseUserRepository.userLogin(UserLoginRequest(
      input.email,
      input.password,
    ));
  }
}

class UserLoginUseCaseInput {
  String email;
  String password;

  UserLoginUseCaseInput(
    this.email,
    this.password,
  );
}
