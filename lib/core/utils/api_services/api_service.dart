import 'package:app_store/core/authentication_models/login_model/login.dart';
import 'package:app_store/core/utils/constants_manager.dart';
import 'package:app_store/features/home/data/models/cart_model.dart';
import 'package:app_store/features/home/data/models/change_fav_cart_model.dart';
import 'package:app_store/features/home/data/models/favorite_model.dart';
import 'package:app_store/features/home/data/models/home_model.dart';
import 'package:app_store/features/search/data/model/search_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'api_service.g.dart';

@RestApi(baseUrl:baseUrl)
abstract class AppServiceClient{
  factory AppServiceClient(Dio dio,{String baseUrl}) = _AppServiceClient;

  @GET("home")
  Future<HomeModel> getHomeData();

  @GET("favorites")
  Future<FavoritesModel> getFavoritesData();

  @GET("carts")
  Future<CartModel> getCartsData();

  @POST("favorites")
  Future<ChangeFavCartModel> changeFavorites(@Field("product_id") int productId,);

  @POST("carts")
  Future<ChangeFavCartModel> changeCart(@Field("product_id") int productId,);

  @POST("products/search")
  Future<SearchModel> getSearchData(@Field("text") String text,);

  @GET("profile")
  Future<AuthenticationModel> getUserData();


}