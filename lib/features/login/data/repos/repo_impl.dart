import 'package:app_store/core/authentication_models/login_model/login.dart';
import 'package:app_store/core/errors/failure.dart';
import 'package:app_store/core/utils/cache_helper.dart';
import 'package:app_store/features/login/data/remote_data_source/login_remote_data_source.dart';
import 'package:app_store/features/login/domain/repos/login_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class LoginRepoImpl extends LoginRepo{
   final LoginRemoteDataSource loginRemoteDataSource;

  final AppPreferences _appPreferences = AppPreferences();

   LoginRepoImpl({ required this.loginRemoteDataSource});


  @override
  Future<Either<Failure, AuthenticationModel>> fetchLoginAuthentications(
      {required String email, required String password}) async{
    try{
      AuthenticationModel loginEntity = await loginRemoteDataSource
          .fetchLoginAuthentication(
          email: email,
          password: password);
      if(loginEntity.status ==true)
        {
          _appPreferences.setUserLogin(true);
          _appPreferences.seToken(loginEntity.data!.token!);
        }
      return right(loginEntity);
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