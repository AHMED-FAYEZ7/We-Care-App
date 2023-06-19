// import 'package:health_care/authentication/data/network/user_api/user_api.dart';
// import 'package:health_care/authentication/data/request/user_request.dart';
// import 'package:health_care/authentication/data/response/user_response/user_response.dart';

// abstract class UserRemoteDataSource {
//   Future<UserDataResponse> userLogin(
//     UserLoginRequest userLoginRequest,
//   );
//   Future<UserForgetPasswordResponse> userForgetPassword(
//     UserForgetPasswordRequest userForgetPasswordRequest,
//   );
//   Future<UserUpdatePasswordResponse> userUpdatePassword(
//     UserUpdatePasswordRequest userUpdatePasswordRequest,
//   );
//   Future userDeleteMe();
//   Future<UserEmailConfirmationResponse> userEmailConfirmation(
//     UserEmailConfirmationRequest userEmailConfirmationRequest,
//   );
//   Future<UserUpdateInfoResponse> userUpdateInfo(
//     UserUpdateInfoRequest userUpdateInfoRequest,
//   );
// }

// class UserRemoteDataSourceImplementer implements UserRemoteDataSource {
//   final UserServiceClient _userServiceClient;
//   UserRemoteDataSourceImplementer(this._userServiceClient);

//   //////////// user login ////////////
//   @override
//   Future<UserDataResponse> userLogin(
//     UserLoginRequest userLoginRequest,
//   ) async {
//     return await _userServiceClient.userLogin(
//       userLoginRequest.email,
//       userLoginRequest.password,
//     );
//   }

//   /////////// user forget password ///////////////////
//   @override
//   Future<UserForgetPasswordResponse> userForgetPassword(
//     UserForgetPasswordRequest userForgetPasswordRequest,
//   ) async {
//     return await _userServiceClient.userForgetPassword(
//       userForgetPasswordRequest.email,
//     );
//   }

//   /////////// user update password /////////////////
//   @override
//   Future<UserUpdatePasswordResponse> userUpdatePassword(
//     UserUpdatePasswordRequest userUpdatePasswordRequest,
//   ) async {
//     return await _userServiceClient.userUpdatePassword(
//       userUpdatePasswordRequest.currentPassword,
//       userUpdatePasswordRequest.newPassword,
//       userUpdatePasswordRequest.confirmNewPassword,
//     );
//   }

//   /////////// user delete me /////////////////
//   @override
//   Future userDeleteMe() async {
//     return await _userServiceClient.userDeleteMe();
//   }

//   /////////// user email confirmation /////////////////
//   @override
//   Future<UserEmailConfirmationResponse> userEmailConfirmation(
//     UserEmailConfirmationRequest userEmailConfirmationRequest,
//   ) async {
//     return await _userServiceClient.userEmailConfirmation(
//       userEmailConfirmationRequest.pin,
//     );
//   }

//   @override
//   Future<UserUpdateInfoResponse> userUpdateInfo(
//     UserUpdateInfoRequest userUpdateInfoRequest,
//   ) async {
//     return await _userServiceClient.userUpdateInfo(
//       userUpdateInfoRequest.emailConfirmed,
//       userUpdateInfoRequest.name,
//       userUpdateInfoRequest.username,
//       userUpdateInfoRequest.email,
//     );
//   }
// }
