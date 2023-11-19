import 'package:app_store/core/authentication_models/login_model/login.dart';
import 'package:app_store/core/errors/failure.dart';
import 'package:app_store/core/utils/cache_helper.dart';
import 'package:app_store/features/register/data/remote_data_source/register_remote_data_source.dart';
import 'package:app_store/features/register/domain/repos/register_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class RegisterRepoImpl extends RegisterRepo{
   final RegisterRemoteDataSource registerRemoteDataSource;
   final AppPreferences _appPreferences = AppPreferences();

   RegisterRepoImpl({required this.registerRemoteDataSource});


  @override
  Future<Either<Failure, AuthenticationModel>> fetchRegisterAuthentications(
      {required String userName,
        required String phone,
        required String email,
        required String password}) async{
    try{
      AuthenticationModel registerData = await registerRemoteDataSource.fetchRegisterAuthentication(
          userName: userName,
          phone: phone,
          email: email,
          password: password);
        if(registerData.status == true)
          {
            _appPreferences.setUserLogin(true);
            _appPreferences.seToken(registerData.data!.token!);
          }
      return right(registerData);
    }catch(e){
      _appPreferences.setUserLogin(false);
      if(e is DioError)
      {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }


}