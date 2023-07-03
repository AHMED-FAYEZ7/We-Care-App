// // ignore_for_file: must_be_immutable

// import 'package:equatable/equatable.dart';

// //////////////// user login /////////////////////
// class UserLoginRequest extends Equatable {
//   String email;
//   String password;

//   @override
//   List<Object> get props => [
//         email,
//         password,
//       ];

//   UserLoginRequest(
//     this.email,
//     this.password,
//   );
// }

// //////////////// user forget password /////////////////////
// class UserForgetPasswordRequest extends Equatable {
//   String email;

//   @override
//   List<Object> get props => [
//         email,
//       ];

//   UserForgetPasswordRequest(
//     this.email,
//   );
// }

// //////////////// user update password /////////////////////
// class UserUpdatePasswordRequest extends Equatable {
//   String currentPassword;
//   String newPassword;
//   String confirmNewPassword;

//   @override
//   List<Object> get props => [
//         currentPassword,
//         newPassword,
//         confirmNewPassword,
//       ];

//   UserUpdatePasswordRequest(
//     this.currentPassword,
//     this.newPassword,
//     this.confirmNewPassword,
//   );
// }

// //////////////// user email confirmation /////////////////////
// class UserEmailConfirmationRequest extends Equatable {
//   int pin;

//   @override
//   List<Object> get props => [
//         pin,
//       ];

//   UserEmailConfirmationRequest(
//     this.pin,
//   );
// }

// //////////////// user update info /////////////////////
// class UserUpdateInfoRequest extends Equatable {
//   bool emailConfirmed;
//   String name;
//   String username;
//   String email;

//   @override
//   List<Object> get props => [
//         emailConfirmed,
//         name,
//         username,
//         email,
//       ];

//   UserUpdateInfoRequest(
//     this.emailConfirmed,
//     this.name,
//     this.username,
//     this.email,
//   );
// }
