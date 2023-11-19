import 'package:app_store/core/authentication_models/login_model/login.dart';
import 'package:app_store/features/home/data/models/change_fav_cart_model.dart';
import 'package:app_store/features/home/domain/entities/banner_entity/home_banner_entity.dart';
import 'package:app_store/features/home/domain/entities/fav_cart_entity/fav_cart_entity.dart';
import 'package:app_store/features/home/domain/entities/product_entity/home_products_entity.dart';

abstract class HomeRemoteDataSource{
  Future <List<BannerEntity>>fetchHomeBannerData();
  Future <List<ProductEntity>>fetchHomeProductsData();
  Future <List<FavCartProductEntity>>fetchFavData();
  Future <List<FavCartProductEntity>>fetchCartData();
  Future <ChangeFavCartModel>changeFavData({required int productId});
  Future <ChangeFavCartModel>changeCartData({required int productId});
  Future <AuthenticationModel>fetchUserData();
}