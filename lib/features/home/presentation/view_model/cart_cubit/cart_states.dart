import 'package:app_store/features/home/domain/entities/fav_cart_entity/fav_cart_entity.dart';

abstract class CartStates{}

class CartInitialState extends CartStates {}

class CartLoadingStates extends CartStates{}

class CartSuccessStates extends CartStates{
  final List<FavCartProductEntity> cartEntity;

  CartSuccessStates(this.cartEntity);
}

class CartErrorStates extends CartStates{
  final String errMessage;

  CartErrorStates(this.errMessage);
}
