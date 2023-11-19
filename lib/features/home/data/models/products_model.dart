import 'package:app_store/features/home/domain/entities/product_entity/home_products_entity.dart';

class ProductModel extends ProductEntity
{
  int? productId;
  num? productPrice;
  num? productOldPrice;
  num? productDisCount;
  String? productImage;
  String? productName;
  bool? productInFavorites;
  bool? productInCart;
  String? productDescription;
  List<dynamic>? productDiffImages;

  ProductModel({
    this.productId,
    this.productPrice,
    this.productOldPrice,
    this.productDisCount,
    this.productImage,
    this.productName,
    this.productInFavorites,
    this.productInCart,
    this.productDescription,
    this.productDiffImages,
  }):super(
    id: productId,
    price:productPrice,
    image: productImage,
    name:  productName,
    disCount: productDisCount,
    inFavorites: productInFavorites,
    inCart:  productInCart,
    description: productDescription,
    oldPrice: productOldPrice,
    images: productDiffImages,


  );
  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      ProductModel(
        productId: json['id'] as int?,
        productPrice: json['price'] as num?,
        productOldPrice: json['old_price'] as num?,
        productDisCount: json['discount'] as num?,
        productImage: json['image'] as String?,
        productName: json['name'] as String?,
        productInFavorites: json['in_favorites'] as bool?,
        productInCart: json['in_cart'] as bool?,
        productDescription: json['description'] as String?,
        productDiffImages: json['images'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
    'id': productId,
    'price': productPrice,
    'name':productName,
    'old_price' : productOldPrice,
    'discount': productDisCount,
    'image': productImage,
    'in_favorites':productInFavorites,
    'in_cart':productInCart,
    'description': productDescription,
    'images' :productDiffImages,
  };


}