import 'package:app_store/core/authentication_models/login_model/login.dart';

abstract class LoginStates{}

class LoginInitialStates extends LoginStates{}

class LoginChangePasswordStates extends LoginStates{}

class LoginDataLoadingStates extends LoginStates{}

class LoginDataSuccessStates extends LoginStates{
  final AuthenticationModel loginEntity;

  LoginDataSuccessStates(this.loginEntity);
}

class LoginDataErrorStates extends LoginStates{
  final String errMessage;

  LoginDataErrorStates(this.errMessage);
}