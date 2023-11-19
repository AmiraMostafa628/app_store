import 'package:app_store/features/home/data/models/home_data_model.dart';

class HomeModel {
  bool? status;
  HomeDataModel? data;

  HomeModel.fromJson(Map<String,dynamic>json)
  {
    status=json['status'];
    data= json['data'] != null ?
    HomeDataModel.fromJson(json['data']):null;


  }

}
