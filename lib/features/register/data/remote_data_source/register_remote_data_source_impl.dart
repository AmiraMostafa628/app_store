import 'package:app_store/core/authentication_models/login_model/login.dart';
import 'package:app_store/core/utils/api_services/api_authentication.dart';
import 'package:app_store/features/register/data/remote_data_source/register_remote_data_source.dart';

class RegisterRemoteDataSourceImpl implements RegisterRemoteDataSource {

  final AppAuthentication _appAuthentication;

  RegisterRemoteDataSourceImpl(this._appAuthentication);


  @override
  Future<AuthenticationModel> fetchRegisterAuthentication(
      {required String userName, required String phone,
        required String email, required String password,
      }) async{
    var data=  await _appAuthentication.register(
      userName,
      phone,
      email,
      password,
      "https://th.bing.com/th/id/OIP.Bureq4JcJeQa1jjSF0kzdwHaEK?pid=ImgDet&w=3840&h=2160&rs=1"
    );
     return data;
  }

}