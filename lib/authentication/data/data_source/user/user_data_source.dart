import 'package:health_care/authentication/data/network/user_api/user_api.dart';
import 'package:health_care/authentication/data/request/user_request.dart';
import 'package:health_care/authentication/data/response/user_response/user_response.dart';

abstract class UserRemoteDataSource {
  Future<UserDataResponse> userLogin(
    UserLoginRequest userLoginRequest,
  );
}

class UserRemoteDataSourceImplementer implements UserRemoteDataSource {
  final UserServiceClient _userServiceClient;
  UserRemoteDataSourceImplementer(this._userServiceClient);

  @override
  Future<UserDataResponse> userLogin(
    UserLoginRequest userLoginRequest,
  ) async {
    return await _userServiceClient.userLogin(
      userLoginRequest.email,
      userLoginRequest.password,
    );
  }
}
