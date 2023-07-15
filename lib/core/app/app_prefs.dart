// ignore_for_file: constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

const String PREFS_KEY_LANG = "PREFS_KEY_LANG";
const String PREFS_KEY_TOKEN = "PREFS_KEY_TOKEN";
const String PREFS_KEY_TYPE = "PREFS_KEY_TYPE";
const String PREFS_KEY_DOCTOR_ID = "PREFS_KEY_DOCTOR_ID";
const String PREFS_KEY_ON_BOARDING_SCREEN = "PREFS_KEY_ON_BOARDING_SCREEN";
const String PREFS_KEY_IS_DOCTOR_LOGGED_IN = "PREFS_KEY_IS_DOCTOR_LOGGED_IN";
const String PREFS_KEY_IS_PATIENT_LOGGED_IN = "PREFS_KEY_IS_PATIENT_LOGGED_IN";

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  Future<void> setToken(String token) async {
    _sharedPreferences.setString(PREFS_KEY_TOKEN, token);
  }

  Future<String> getToken() async {
    return _sharedPreferences.getString(PREFS_KEY_TOKEN) ?? "NO TOKEN SAVED";
  }

  Future<void> setType(String type) async {
    _sharedPreferences.setString(PREFS_KEY_TYPE, type);
  }

  Future<String> getType() async {
    return _sharedPreferences.getString(PREFS_KEY_TYPE) ?? "NO TYPE SAVED";
  }

  Future<void> setIsDoctorLoggedIn() async {
    _sharedPreferences.setBool(PREFS_KEY_IS_DOCTOR_LOGGED_IN, true);
  }

  Future<bool> isDoctorLoggedIn() async {
    return _sharedPreferences.getBool(PREFS_KEY_IS_DOCTOR_LOGGED_IN) ?? false;
  }

  Future<void> setIsPatientLoggedIn() async {
    _sharedPreferences.setBool(PREFS_KEY_IS_PATIENT_LOGGED_IN, true);
  }

  Future<bool> isPatientLoggedIn() async {
    return _sharedPreferences.getBool(PREFS_KEY_IS_PATIENT_LOGGED_IN) ?? false;
  }

  Future<void> setOnBoardingScreenViewed() async {
    _sharedPreferences.setBool(PREFS_KEY_ON_BOARDING_SCREEN, true);
  }

  Future<bool> isOnBoardingScreenViewed() async {
    return _sharedPreferences.getBool(PREFS_KEY_ON_BOARDING_SCREEN) ?? false;
  }

  Future<void> logout() async {
    _sharedPreferences.remove(PREFS_KEY_IS_PATIENT_LOGGED_IN);
    _sharedPreferences.remove(PREFS_KEY_IS_DOCTOR_LOGGED_IN);
  }

  Future<void> clearSharedPreferences() async {
    _sharedPreferences.clear();
  }
}
