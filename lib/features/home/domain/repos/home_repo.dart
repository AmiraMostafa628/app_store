import 'package:app_store/core/errors/failure.dart';
import 'package:app_store/features/home/data/models/change_fav_cart_model.dart';
import 'package:app_store/features/home/domain/entities/banner_entity/home_banner_entity.dart';
import 'package:app_store/features/home/domain/entities/product_entity/home_products_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo{

   Future<Either<Failure,List<BannerEntity>>> fetchHomeDataBanners();
   Future<Either<Failure,List<ProductEntity>>> fetchHomeDataProducts();
   Future<Either<Failure,ChangeFavCartModel>> changeFavoriteProducts(int productId);
   Future<Either<Failure,ChangeFavCartModel>> changeCartProducts(int productId);


}



