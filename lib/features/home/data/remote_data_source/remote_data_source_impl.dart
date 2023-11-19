import 'package:app_store/core/authentication_models/login_model/login.dart';
import 'package:app_store/core/utils/api_services/api_service.dart';
import 'package:app_store/features/home/data/models/change_fav_cart_model.dart';
import 'package:app_store/features/home/data/remote_data_source/remote_data_source.dart';
import 'package:app_store/features/home/domain/entities/banner_entity/home_banner_entity.dart';
import 'package:app_store/features/home/domain/entities/fav_cart_entity/fav_cart_entity.dart';
import 'package:app_store/features/home/domain/entities/product_entity/home_products_entity.dart';

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource{

  final AppServiceClient _appServiceClient;

  HomeRemoteDataSourceImpl(this._appServiceClient);

  @override
  Future<List<BannerEntity>> fetchHomeBannerData() async {
    var data = await _appServiceClient.getHomeData();
    return data.data!.banners!;
  }

  @override
  Future<List<ProductEntity>> fetchHomeProductsData() async {
    var data = await _appServiceClient.getHomeData();
    return data.data!.products!;
  }

  @override
  Future<List<FavCartProductEntity>> fetchCartData() async {
    var data = await _appServiceClient.getCartsData();
    return data.data?.cartItems?? [];

  }

  @override
  Future<List<FavCartProductEntity>> fetchFavData() async {
    var data = await _appServiceClient.getFavoritesData();
    return data.data?.data?? [] ;
  }

  @override
  Future<ChangeFavCartModel> changeCartData({required int productId}) async{
    var data = await _appServiceClient.changeCart(productId);
    return data;
  }

  @override
  Future<ChangeFavCartModel> changeFavData({required int productId}) async{
    var data = await _appServiceClient.changeFavorites(productId);
    return data;
  }

  @override
  Future<AuthenticationModel> fetchUserData() async{
    var data = await _appServiceClient.getUserData();
    return data;
  }


}