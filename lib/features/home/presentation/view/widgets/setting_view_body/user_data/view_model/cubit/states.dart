import 'package:app_store/core/authentication_models/login_model/login.dart';

abstract class UserDataStates{}

class UserDataInitialStates extends UserDataStates{}

class UserDataLoadingStates extends UserDataStates{}

class UserDataSuccessStates extends UserDataStates{
  final AuthenticationModel userDataEntity;

  UserDataSuccessStates(this.userDataEntity);
}

class UserDataErrorStates extends UserDataStates{
  final String errMessage;

  UserDataErrorStates(this.errMessage);

}