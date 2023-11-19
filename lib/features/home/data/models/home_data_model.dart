import 'package:app_store/features/home/data/models/banner_model.dart';
import 'package:app_store/features/home/data/models/products_model.dart';

class HomeDataModel {
  List<BannerModel>? banners =[];
  List<ProductModel>? products=[];



  HomeDataModel.fromJson(Map<String,dynamic>json)
  {
    json['banners'].forEach((element){
      banners!.add(BannerModel.fromJson(element));
    });

    json['products'].forEach((element){
      products!.add(ProductModel.fromJson(element));
    });

  }
}
