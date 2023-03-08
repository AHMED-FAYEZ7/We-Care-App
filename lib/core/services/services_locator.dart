// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:health_care/authentication/data/data_source/doctor/doctor_remote_data_source.dart';
import 'package:health_care/authentication/data/data_source/patient/patient_remote_data_source.dart';
import 'package:health_care/authentication/data/network/doctor_api/doctor_api.dart';
import 'package:health_care/authentication/data/network/patient_api/patient_api.dart';
import 'package:health_care/authentication/data/repository/doctor_repository_impl.dart';
import 'package:health_care/authentication/data/repository/patient_repository_impl.dart';
import 'package:health_care/authentication/domain/model/doctor_model.dart';
import 'package:health_care/authentication/domain/repository/doctor_auth_repository.dart';
import 'package:health_care/authentication/domain/repository/patient_auth_repository.dart';
import 'package:health_care/authentication/domain/usecase/doctor_sinup_usecase.dart';
import 'package:health_care/authentication/domain/usecase/patient_signup_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../network/dio_factory.dart';
import '../network/network_info.dart';
import '../preferences/app_prefs.dart';

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

  // Patient  service client
  final dio = await sl<DioFactory>().getDio();
  sl.registerLazySingleton<PatientServiceClient>(
      () => PatientServiceClient(dio));

  // Patient remote data source
  sl.registerLazySingleton<PatientRemoteDataSource>(
      () => PatientRemoteDataSourceImplementer(sl()));

  // Patient repository
  sl.registerLazySingleton<PatientAuthRepository>(
      () => PatientAuthRepositoryImpl(sl(), sl()));

  // Patient useCase

  sl.registerFactory<PatientSignUpUseCase>(() => PatientSignUpUseCase(sl()));

  // Patient  service client
  sl.registerLazySingleton<DoctorServiceClient>(() => DoctorServiceClient(dio));

  // Patient remote data source
  sl.registerLazySingleton<BaseDoctorRemoteDataSource>(
      () => DoctorRemoteDataSourceImpl(sl()));

  // Patient repository
  sl.registerLazySingleton<BaseDoctorAuthRepository>(
      () => DoctorAuthRepositoryImpl(sl(), sl()));

  // Patient useCase

  sl.registerFactory<DoctorSignUpUseCase>(() => DoctorSignUpUseCase(sl()));
}



// initRegisterModule() {
//   if (!GetIt.I.isRegistered<PatientSignUpUseCase>()) {
//     sl.registerFactory<PatientSignUpUseCase>(() => PatientSignUpUseCase(sl()));
//   }
// }
