import 'package:app_store/features/home/domain/entities/product_entity/home_products_entity.dart';

abstract class HomeProductStates{}

class HomeProductInitialState extends HomeProductStates {}

class HomeProductLoadingStates extends HomeProductStates{}

class HomeProductSuccessStates extends HomeProductStates{
  final List<ProductEntity> productEntity;

  HomeProductSuccessStates(this.productEntity);
}

class HomeProductErrorStates extends HomeProductStates{
  final String errMessage;

  HomeProductErrorStates(this.errMessage);
}

class ChangeFavoriteProductsSuccessStates extends HomeProductStates{
  final String message;

  ChangeFavoriteProductsSuccessStates(this.message);
}

class ChangeFavoriteProductsErrorStates extends HomeProductStates{}

class ChangeCartProductsSuccessStates extends HomeProductStates{
  final String message;

  ChangeCartProductsSuccessStates(this.message);
}

class ChangeCartProductsErrorStates extends HomeProductStates{}

