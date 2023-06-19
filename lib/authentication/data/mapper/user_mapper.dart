import 'package:health_care/authentication/data/response/user_response/user_response.dart';
import 'package:health_care/authentication/domain/model/user_model.dart';
import 'package:health_care/core/utils/extension.dart';

//////////// user login ////////////
extension UserResponseMapper on UserResponse? {
  User toDomain() {
    return User(
      this?.specialization?.orEmpty() ?? EMPTY,
      this?.fees?.orEmpty() ?? EMPTY,
      this?.timePerPatient?.orEmpty() ?? EMPTY,
      this?.scheduleTiming?.orEmptyList() ?? EMPTY_LIST,
      this?.appointments?.orEmptyList() ?? EMPTY_LIST,
      this?.patients?.orEmptyList() ?? EMPTY_LIST,
      this?.numberOfRating?.orZeroDouble() ?? ZERO_DOUBLE,
      this?.averageRating?.orZeroDouble() ?? ZERO_DOUBLE,
      this?.status?.orEmpty() ?? EMPTY,
      this?.id?.orEmpty() ?? EMPTY,
      this?.name?.orEmpty() ?? EMPTY,
      this?.email?.orEmpty() ?? EMPTY,
      this?.profilePicture?.orEmpty() ?? EMPTY,
      this?.confirmed?.orFalse() ?? FALSE,
      this?.active?.orFalse() ?? FALSE,
      this?.type?.orEmpty() ?? EMPTY,
      this?.address?.orEmptyList() ?? EMPTY_LIST,
      this?.userName?.orEmpty() ?? EMPTY,
      this?.v?.orZero() ?? ZERO,
    );
  }
}

extension UserDataResponseMapper on UserDataResponse? {
  UserData toDomain() {
    return UserData(
      this?.token?.orEmpty() ?? EMPTY,
      this?.user?.toDomain(),
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
      this?.user?.toDomain(),
    );
  }
}
