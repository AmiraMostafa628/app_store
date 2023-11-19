import 'package:app_store/features/home/data/models/fav_cart_product_model.dart';
import 'package:app_store/features/home/domain/entities/fav_cart_entity/fav_cart_entity.dart';

class CartModel {
  dynamic status;
  Data? data;

  CartModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

 class Data{
  List<CartData>? cartItems;
  Data({this.cartItems});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    cartItems: (json['cart_items'] as List<dynamic>?)
        ?.map((e) => CartData.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

}

class CartData  extends FavCartProductEntity{
  FavCartProduct? product;

  CartData({this.product}) : super(
    id: product!.id,
    name: product.name,
    image: product.image,
    price: product.price,

  );

 factory CartData.fromJson(Map<String, dynamic> json) => CartData(
   product: json['product'] != null ?
   FavCartProduct.fromJson(json['product'] as Map<String, dynamic>) : null,
 );

}
