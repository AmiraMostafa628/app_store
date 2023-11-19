
import 'package:app_store/core/utils/app_router.dart';
import 'package:app_store/core/utils/constants_manager.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  static late SharedPreferences _sharedPreferences;

  static init() async
  {
    _sharedPreferences= await SharedPreferences.getInstance();
  }


  Future<void> setUserLogin(bool userData) async{
    _sharedPreferences.setBool(kUserLogin, userData);
  }

  Future<bool?> getUserLogin() async{
    return _sharedPreferences.getBool(kUserLogin);
  }

  Future<void> seToken(String token) async{
    _sharedPreferences.setString(kToken, token);
  }

  static Future<String> getToken() async{
    return _sharedPreferences.getString(kToken)?? '';
  }

  Future<void> logout(BuildContext context) async {
    await _sharedPreferences.remove(kUserLogin);
    await _sharedPreferences.remove(kToken);

    GoRouter.of(context).push(AppRouter.kLogin);
  }
}