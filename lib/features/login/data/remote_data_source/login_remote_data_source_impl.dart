import 'package:app_store/core/authentication_models/login_model/login.dart';
import 'package:app_store/core/utils/api_services/api_authentication.dart';
import 'package:app_store/features/login/data/remote_data_source/login_remote_data_source.dart';

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {

  final AppAuthentication _appAuthentication;

  LoginRemoteDataSourceImpl(this._appAuthentication);

  @override
   Future <AuthenticationModel>fetchLoginAuthentication(
      {required String email,
        required String password}) async {
    return await _appAuthentication.login(email, password);
  }
}