import 'package:dartz/dartz.dart';
import 'package:health_care/authentication/data/request/user_request.dart';
import 'package:health_care/authentication/domain/model/user_model.dart';
import 'package:health_care/authentication/domain/repository/user_repository.dart';
import 'package:health_care/core/error/failure.dart';
import 'package:health_care/core/usecase/base_usecase.dart';

class UserUpdatePasswordUseCase
    extends BaseUseCase<UserUpdatePasswordUseCaseInput, UserUpdatePassword> {
  final BaseUserRepository _baseUserRepository;

  UserUpdatePasswordUseCase(
    this._baseUserRepository,
  );

  @override
  Future<Either<Failure, UserUpdatePassword>> call(
      UserUpdatePasswordUseCaseInput input) async {
    return await _baseUserRepository.userUpdatePassword(
      UserUpdatePasswordRequest(
        input.currentPassword,
        input.newPassword,
        input.confirmNewPassword,
      ),
    );
  }
}

class UserUpdatePasswordUseCaseInput {
  String currentPassword;
  String newPassword;
  String confirmNewPassword;

  UserUpdatePasswordUseCaseInput(
    this.currentPassword,
    this.newPassword,
    this.confirmNewPassword,
  );
}
