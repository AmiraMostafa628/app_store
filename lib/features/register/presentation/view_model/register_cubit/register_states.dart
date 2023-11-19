import 'package:app_store/core/authentication_models/login_model/login.dart';

abstract class RegisterStates{}

class RegisterCubitInitialStates extends RegisterStates{}

class RegisterCubitChangePasswordStates extends RegisterStates{}

class RegisterDataLoadingStates extends RegisterStates{}

class RegisterDataSuccessStates extends RegisterStates{
  final AuthenticationModel registerEntity;

  RegisterDataSuccessStates(this.registerEntity);
}

class RegisterDataErrorStates extends RegisterStates{
  final String errMessage;

  RegisterDataErrorStates(this.errMessage);
}