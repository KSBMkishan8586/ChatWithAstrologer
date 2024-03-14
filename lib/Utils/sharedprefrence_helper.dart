import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper{
  static late SharedPreferences _preferences;

  static Future<void> initialize() async {
    _preferences = await SharedPreferences.getInstance();
  }


  static Future<void> setUserMobileNumber(String mobileNumber) async {
    await _preferences.setString('mobileNumber', mobileNumber);
  }


  static String getMobileNumber({String defaultValue = ''}) {
    return _preferences.getString('mobileNumber') ?? defaultValue;
  }

  static Future<void> setIsNewUser(String isNewUser) async {
    await _preferences.setString('isNewUser', isNewUser);
  }

  static String getIsNewUser({String defaultValue = ''}) {
    return _preferences.getString('isNewUser') ?? defaultValue;
  }

  static Future<void> setUserName(String userName) async {
    await _preferences.setString('userName', userName);
  }

  static String getUserName({String defaultValue = ''}) {
    return _preferences.getString('userName') ?? defaultValue;
  }

  static Future<void> setGender(String gender) async {
    await _preferences.setString('gender', gender);
  }

  static String getGender({String defaultValue = ''}) {
    return _preferences.getString('gender') ?? defaultValue;
  }

  static Future<void> setUserImage(String userImage) async {
    await _preferences.setString('userImage', userImage);
  }

  static String getUserImage({String defaultValue = ''}) {
    return _preferences.getString('userImage') ?? defaultValue;
  }

  static Future<void> setUserEmail(String userEmail) async {
    await _preferences.setString('userEmail', userEmail);
  }

  static String getUserEmail({String defaultValue = ''}) {
    return _preferences.getString('userEmail') ?? defaultValue;
  }

  static Future<void> setUserId(String userId) async {
    await _preferences.setString('userId', userId);
  }

  static String getUserID({String defaultValue = ''}) {
    return _preferences.getString('userId') ?? defaultValue;
  }

  static Future<void> setReferCode(String referCode) async {
    await _preferences.setString('referCode', referCode);
  }

  static String getReferCode({String defaultValue = ''}) {
    return _preferences.getString('referCode') ?? defaultValue;
  }

  static Future<void> isLoggedIn(String isLoggedIn) async{
    await _preferences.setString('isLoggedIn', isLoggedIn);
  }

  static String getIsLoggedIn({String defalutValue =''}) {
    return _preferences.getString('isLoggedIn') ?? defalutValue;
  }
  static Future<void> clearAllData() async {
    await _preferences.clear();
  }
}