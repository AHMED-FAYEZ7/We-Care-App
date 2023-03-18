import 'package:dartz/dartz.dart';
import 'package:health_care/authentication/data/request/user_request.dart';
import 'package:health_care/authentication/domain/model/user_model.dart';
import 'package:health_care/authentication/domain/repository/user_repository.dart';
import 'package:health_care/core/error/failure.dart';
import 'package:health_care/core/usecase/base_usecase.dart';

class UserUpdateInfoUseCase
    implements BaseUseCase<UserUpdateInfoUseCaseInput, UserUpdateInfo> {
  final BaseUserRepository _baseUserRepository;
  UserUpdateInfoUseCase(
    this._baseUserRepository,
  );

  @override
  Future<Either<Failure, UserUpdateInfo>> call(
    UserUpdateInfoUseCaseInput input,
  ) async {
    return await _baseUserRepository.userUpdateInfo(
      UserUpdateInfoRequest(
        input.emailConfirmed,
        input.name,
        input.username,
        input.email,
      ),
    );
  }
}

class UserUpdateInfoUseCaseInput {
  bool emailConfirmed;
  String name;
  String username;
  String email;

  UserUpdateInfoUseCaseInput(
    this.emailConfirmed,
    this.name,
    this.username,
    this.email,
  );
}
