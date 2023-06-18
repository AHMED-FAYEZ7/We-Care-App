import 'package:health_care/authentication/data/response/user_response/user_response.dart';
import 'package:health_care/authentication/domain/model/user_model.dart';
import 'package:health_care/core/utils/constants.dart';
import 'package:health_care/core/utils/extension.dart';

//////////// user login ////////////
extension UserResponseMapper on UserResponse? {
  User toDomain() {
    return User(
      this?.appointments?.orEmptyList() ?? Constants.emptyList,
      this?.id?.orEmpty() ?? Constants.empty,
      this?.name?.orEmpty() ?? Constants.empty,
      this?.email?.orEmpty() ?? Constants.empty,
      this?.confirmed?.orFalse() ?? Constants.FALSE,
      this?.type?.orEmpty() ?? Constants.empty,
      this?.userName?.orEmpty() ?? Constants.empty,
      this?.v?.orZero() ?? Constants.zero,
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
      this?.token?.orEmpty() ?? Constants.empty,
      this?.data?.toDomain(),
    );
  }
}

/////////// user forget password ///////////////////
extension UserForgetPasswordMapper on UserForgetPasswordResponse? {
  UserForgetPassword toDomain() {
    return UserForgetPassword(
      this?.status?.orEmpty() ?? Constants.empty,
      this?.message?.orEmpty() ?? Constants.empty,
    );
  }
}

/////////// user update password /////////////////
extension UserUpdatePasswordMapper on UserUpdatePasswordResponse? {
  UserUpdatePassword toDomain() {
    return UserUpdatePassword(
      this?.status?.orEmpty() ?? Constants.empty,
      this?.message?.orEmpty() ?? Constants.empty,
      this?.token?.orEmpty() ?? Constants.empty,
    );
  }
}

/////////// user email confirmation ///////////////////
extension UserEmailConfirmationMapper on UserEmailConfirmationResponse? {
  UserEmailConfirmation toDomain() {
    return UserEmailConfirmation(
      this?.status?.orEmpty() ?? Constants.empty,
      this?.message?.orEmpty() ?? Constants.empty,
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
