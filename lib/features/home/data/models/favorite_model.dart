import 'package:app_store/features/home/data/models/fav_cart_product_model.dart';
import 'package:app_store/features/home/domain/entities/fav_cart_entity/fav_cart_entity.dart';

class FavoritesModel {
  dynamic status;
  Data? data;

  FavoritesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  List<FavoritesData> data=[];
  Data.fromJson(Map<String, dynamic> json) {
    json['data'].forEach((element) {
      data.add(FavoritesData.fromJson(element));
    });

  }
}
class FavoritesData extends FavCartProductEntity{
  FavCartProduct? product;

  FavoritesData({
    this.product,
}):super(
      id: product?.id,
      name: product?.name,
      image: product?.image,
      price: product?.price
  );

  factory FavoritesData.fromJson(Map<String, dynamic> json) => FavoritesData(
    product: json['product'] == null
        ? null
        : FavCartProduct.fromJson(json['product'] as Map<String, dynamic>),
  );

}


