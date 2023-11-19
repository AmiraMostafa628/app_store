import 'package:app_store/features/home/domain/entities/banner_entity/home_banner_entity.dart';

abstract class HomeBannerStates{}

class HomeBannerInitialState extends HomeBannerStates {}

class HomeBannerLoadingStates extends HomeBannerStates{}

class HomeBannerSuccessStates extends HomeBannerStates{
  final List<BannerEntity> bannerEntity;

  HomeBannerSuccessStates(this.bannerEntity);
}

class HomeBannerErrorStates extends HomeBannerStates{
  final String errMessage;

  HomeBannerErrorStates(this.errMessage);
}

