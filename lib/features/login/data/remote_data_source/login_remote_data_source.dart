
import 'package:app_store/core/authentication_models/login_model/login.dart';

abstract class LoginRemoteDataSource{
  Future <AuthenticationModel>fetchLoginAuthentication(
      {required String email,required String password,});

}

