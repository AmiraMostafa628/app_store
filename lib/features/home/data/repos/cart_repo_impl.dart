import 'package:app_store/core/errors/failure.dart';
import 'package:app_store/features/home/data/remote_data_source/remote_data_source.dart';
import 'package:app_store/features/home/domain/entities/fav_cart_entity/fav_cart_entity.dart';
import 'package:app_store/features/home/domain/repos/cart_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class CartRepoImpl extends CartRepo{
  final HomeRemoteDataSource homeRemoteDataSource;

  CartRepoImpl({required this.homeRemoteDataSource});

  @override
  Future<Either<Failure, List<FavCartProductEntity>>> fetchCartProducts() async{
    try{
      List<FavCartProductEntity> cartEntity =
      await homeRemoteDataSource.fetchCartData();
      return right(cartEntity);
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