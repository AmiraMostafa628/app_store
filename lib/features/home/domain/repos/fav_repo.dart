import 'package:app_store/core/errors/failure.dart';
import 'package:app_store/features/home/domain/entities/fav_cart_entity/fav_cart_entity.dart';
import 'package:dartz/dartz.dart';

abstract class FavRepo{
  Future<Either<Failure,List<FavCartProductEntity>>> fetchFavProducts();
}