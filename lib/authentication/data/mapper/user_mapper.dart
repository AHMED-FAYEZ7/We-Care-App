import 'package:health_care/authentication/data/response/user_response/user_response.dart';
import 'package:health_care/authentication/domain/model/user_model.dart';
import 'package:health_care/core/utils/extension.dart';

//////////// user login ////////////
extension UserResponseMapper on UserResponse? {
  User toDomain() {
    return User(
      this?.appointments?.orEmptyList() ?? EMPTY_LIST,
      this?.id?.orEmpty() ?? EMPTY,
      this?.name?.orEmpty() ?? EMPTY,
      this?.email?.orEmpty() ?? EMPTY,
      this?.confirmed?.orFalse() ?? FALSE,
      this?.type?.orEmpty() ?? EMPTY,
      this?.userName?.orEmpty() ?? EMPTY,
      this?.v?.orZero() ?? ZERO,
    );
  }
}

extension DataResponseMapper on DataResponse? {
  Data toDomain() {
    return Data(
      this?.user?.toDomain(),
    );
  }
}

extension UserDataResponseMapper on UserDataResponse? {
  UserData toDomain() {
    return UserData(
      this?.token?.orEmpty() ?? EMPTY,
      this?.data?.toDomain(),
    );
  }
}

/////////// user forget password ///////////////////
extension UserForgetPasswordMapper on UserForgetPasswordResponse? {
  UserForgetPassword toDomain() {
    return UserForgetPassword(
      this?.status?.orEmpty() ?? EMPTY,
      this?.message?.orEmpty() ?? EMPTY,
    );
  }
}

/////////// user update password /////////////////
extension UserUpdatePasswordMapper on UserUpdatePasswordResponse? {
  UserUpdatePassword toDomain() {
    return UserUpdatePassword(
      this?.status?.orEmpty() ?? EMPTY,
      this?.message?.orEmpty() ?? EMPTY,
      this?.token?.orEmpty() ?? EMPTY,
    );
  }
}

/////////// user email confirmation ///////////////////
extension UserEmailConfirmationMapper on UserEmailConfirmationResponse? {
  UserEmailConfirmation toDomain() {
    return UserEmailConfirmation(
      this?.status?.orEmpty() ?? EMPTY,
      this?.message?.orEmpty() ?? EMPTY,
    );
  }
}

/////////// user email confirmation ///////////////////
extension UserUpdateInfoMapper on UserUpdateInfoResponse? {
  UserUpdateInfo toDomain() {
    return UserUpdateInfo(
      this?.data?.toDomain(),
    );
  }
}
