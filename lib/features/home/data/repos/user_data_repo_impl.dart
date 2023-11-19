import 'package:app_store/core/authentication_models/login_model/login.dart';
import 'package:app_store/core/errors/failure.dart';
import 'package:app_store/features/home/data/remote_data_source/remote_data_source.dart';
import 'package:app_store/features/home/domain/repos/user_data_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class UserDataRepoImpl extends UserDataRepo{

  final HomeRemoteDataSource homeRemoteDataSource;

  UserDataRepoImpl({required this.homeRemoteDataSource});

  @override
  Future<Either<Failure, AuthenticationModel>> fetchUserData() async {
    try{
      AuthenticationModel userEntity =
          await homeRemoteDataSource.fetchUserData();
      return right(userEntity);
    }catch(error){
      if(error is DioError)
      {
        return left(ServerFailure.fromDioError(error));
      }
      else
      {
        return left(ServerFailure(error.toString()));
      }

    }
  }

}