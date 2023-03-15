import 'package:health_care/authentication/data/response/user_response/user_response.dart';
import 'package:health_care/authentication/domain/model/user_model.dart';
import 'package:health_care/core/utils/extension.dart';

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

extension UserForgetPasswordMapper on UserForgetPasswordResponse? {
  UserForgetPassword toDomain() {
    return UserForgetPassword(
      this?.status.orEmpty() ?? EMPTY,
      this?.message.orEmpty() ?? EMPTY,
    );
  }
}
