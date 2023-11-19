import 'package:app_store/features/home/domain/entities/fav_cart_entity/fav_cart_entity.dart';

abstract class FavoriteStates{}

class FavoriteInitialState extends FavoriteStates {}

class FavoriteLoadingStates extends FavoriteStates{}

class FavoriteSuccessStates extends FavoriteStates{
  final List<FavCartProductEntity> favEntity;

  FavoriteSuccessStates(this.favEntity);
}

class FavoriteErrorStates extends FavoriteStates{
  final String errMessage;

  FavoriteErrorStates(this.errMessage);
}
