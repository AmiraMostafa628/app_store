import 'package:app_store/core/errors/failure.dart';
import 'package:app_store/features/home/data/models/change_fav_cart_model.dart';
import 'package:app_store/features/home/data/remote_data_source/remote_data_source.dart';
import 'package:app_store/features/home/domain/entities/banner_entity/home_banner_entity.dart';
import 'package:app_store/features/home/domain/entities/product_entity/home_products_entity.dart';
import 'package:app_store/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl extends HomeRepo{

  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepoImpl({required this.homeRemoteDataSource});

  @override
  Future<Either<Failure, List<BannerEntity>>> fetchHomeDataBanners()async {
    try{
      List<BannerEntity> bannerEntity =
            await homeRemoteDataSource.fetchHomeBannerData();
            return right(bannerEntity);
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

  @override
  Future<Either<Failure, List<ProductEntity>>> fetchHomeDataProducts()async {
    try{
      List<ProductEntity> productEntity =
      await homeRemoteDataSource.fetchHomeProductsData();
      return right(productEntity);
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

  @override
  Future<Either<Failure, ChangeFavCartModel>> changeCartProducts(int productId) async{
    try{
      ChangeFavCartModel changeCartProduct =
          await homeRemoteDataSource.changeCartData(productId: productId);
      return right(changeCartProduct);
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

  @override
  Future<Either<Failure, ChangeFavCartModel>> changeFavoriteProducts(int productId) async{
    try{
      ChangeFavCartModel changeFavProduct =
      await homeRemoteDataSource.changeFavData(productId: productId);
      return right(changeFavProduct);
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