class ProductEntity {
  int? id;
  num? price;
  String? image;
  String? name;
  num? disCount;
  bool? inFavorites;
  bool? inCart;
  String? description;
  num? oldPrice;
  List<dynamic>? images;

  ProductEntity({
     required this.id,
     required this.price,
     required this.image,
     required this.name,
     required this.disCount,
     required this.inCart,
     required this.inFavorites,
     required this.description,
     required this.oldPrice,
     required this.images,
  });

}