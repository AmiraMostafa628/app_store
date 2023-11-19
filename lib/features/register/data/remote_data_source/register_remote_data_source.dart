import 'package:app_store/core/authentication_models/login_model/login.dart';

abstract class RegisterRemoteDataSource{
  Future<AuthenticationModel> fetchRegisterAuthentication(
      {
        required String userName,required String phone,
        required String email,required String password,
      });

}

