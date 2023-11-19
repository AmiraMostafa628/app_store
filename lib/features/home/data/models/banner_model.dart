import 'package:app_store/features/home/domain/entities/banner_entity/home_banner_entity.dart';

class BannerModel extends BannerEntity
{
  int? bannerId;
  String? bannerImage;

  BannerModel({
    this.bannerId,
    this.bannerImage,
  }):super(
    id: bannerId,
    image: bannerImage,
  );

  factory BannerModel.fromJson(Map<String, dynamic> json) =>
      BannerModel(
        bannerId: json['id'] as int?,
        bannerImage: json['image'] as String?,
    );

  Map<String, dynamic> toJson() => {
    'id': bannerId,
    'image': bannerImage,
  };

}