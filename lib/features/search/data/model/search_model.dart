import 'package:app_store/features/home/domain/entities/product_entity/home_products_entity.dart';

class SearchModel {
  bool? status;
  SearchData? data;

  SearchModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? SearchData.fromJson(json['data']) : null;
  }
}

class SearchData {
  List<SearchProduct> data=[];


  SearchData.fromJson(Map<String, dynamic> json) {
    json['data'].forEach((element) {
      data.add(SearchProduct.fromJson(element));
    });


  }

}
class SearchProduct extends ProductEntity{
  int? id;
  num? price;
  int? discount;
  String? image;
  String? name;
  String? description;
  bool? inFavorites;
  bool? inCart;
  List<dynamic>? productImages;

  SearchProduct({
    this.id,
    this.price,
    this.image,
    this.name,
    this.inCart,
    this.inFavorites,
    this.description,
    this.productImages,
  }):super(
    id: id,
    price:price,
    image: image,
    name:  name,
    disCount: 0,
    inFavorites: inFavorites,
    inCart:  inCart,
    description: description,
    oldPrice: 0.0,
    images: productImages,


  );

  factory SearchProduct.fromJson(Map<String, dynamic> json) =>
      SearchProduct(
        id: json['id'] as int?,
        price: json['price'] as num?,
        image: json['image'] as String?,
        name: json['name'] as String?,
        inFavorites: json['in_favorites'] as bool?,
        inCart: json['in_cart'] as bool?,
        description: json['description'] as String?,
        productImages: json['images'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'price': price,
    'name':name,
    'image': image,
    'in_favorites':inFavorites,
    'in_cart':inCart,
    'description': description,
    'images' :productImages,
  };

}
