// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:health_care/authentication/data/data_source/doctor/doctor_remote_data_source.dart';
import 'package:health_care/authentication/data/data_source/patient/patient_remote_data_source.dart';
import 'package:health_care/authentication/data/data_source/user/user_data_source.dart';
import 'package:health_care/authentication/data/network/doctor_api/doctor_api.dart';
import 'package:health_care/authentication/data/network/patient_api/patient_api.dart';
import 'package:health_care/authentication/data/network/user_api/user_api.dart';
import 'package:health_care/authentication/data/repository/doctor_repository_impl.dart';
import 'package:health_care/authentication/data/repository/patient_repository_impl.dart';
import 'package:health_care/authentication/data/repository/user_data_impl.dart';
import 'package:health_care/authentication/domain/repository/doctor_auth_repository.dart';
import 'package:health_care/authentication/domain/repository/patient_auth_repository.dart';
import 'package:health_care/authentication/domain/repository/user_repository.dart';
import 'package:health_care/authentication/domain/usecase/doctor_sinup_usecase.dart';
import 'package:health_care/authentication/domain/usecase/patient_signup_usecase.dart';
import 'package:health_care/authentication/domain/usecase/user_forget_password_usecase.dart';
import 'package:health_care/authentication/domain/usecase/user_login_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../network/dio_factory.dart';
import '../network/network_info.dart';
import '../app/app_prefs.dart';

final sl = GetIt.instance;

Future<void> initAppModule() async {
  final sharedPrefs = await SharedPreferences.getInstance();

  // shared prefs instance
  sl.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  // app prefs instance
  sl.registerLazySingleton<AppPreferences>(() => AppPreferences(sl()));

  // network info
  sl.registerLazySingleton<NetworkInfo>(
      () => NetWorkInfoImpl(DataConnectionChecker()));

  // dio factory
  sl.registerLazySingleton<DioFactory>(() => DioFactory(sl()));
}

initPatientSignUpModule() async {
  if (!GetIt.I.isRegistered<PatientSignUpUseCase>()) {
    final dio = await sl<DioFactory>().getDio();
    sl.registerFactory<PatientServiceClient>(() => PatientServiceClient(dio));
    sl.registerFactory<PatientRemoteDataSource>(
        () => PatientRemoteDataSourceImplementer(sl()));
    sl.registerFactory<BasePatientAuthRepository>(
        () => PatientAuthRepositoryImpl(sl(), sl()));
    sl.registerFactory<PatientSignUpUseCase>(() => PatientSignUpUseCase(sl()));
  }
}

initDoctorSignUpModule() async {
  if (!GetIt.I.isRegistered<DoctorSignUpUseCase>()) {
    final dio = await sl<DioFactory>().getDio();
    sl.registerFactory<DoctorServiceClient>(() => DoctorServiceClient(dio));
    sl.registerFactory<BaseDoctorRemoteDataSource>(
        () => DoctorRemoteDataSourceImpl(sl()));
    sl.registerFactory<BaseDoctorAuthRepository>(
        () => DoctorAuthRepositoryImpl(sl(), sl()));
    sl.registerFactory<DoctorSignUpUseCase>(() => DoctorSignUpUseCase(sl()));
  }
}

initUserModule() async {
  final dio = await sl<DioFactory>().getDio();
  sl.registerFactory<UserServiceClient>(() => UserServiceClient(dio));

  // user remote data source
  sl.registerFactory<UserRemoteDataSource>(
      () => UserRemoteDataSourceImplementer(sl()));

  // user repository
  sl.registerFactory<BaseUserRepository>(
      () => BaseUserRepositoryImpl(sl(), sl()));
}

initUserLoginModule() {
  if (!GetIt.I.isRegistered<UserLoginUseCase>()) {
    sl.registerFactory<UserLoginUseCase>(() => UserLoginUseCase(sl()));
  }
}

initUserForgetPasswordModule() {
  if (!GetIt.I.isRegistered<UserForgetPasswordUseCase>()) {
    sl.registerFactory<UserForgetPasswordUseCase>(
        () => UserForgetPasswordUseCase(sl()));
  }
}
