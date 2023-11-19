import 'package:app_store/core/utils/constants_manager.dart';
import 'package:app_store/core/utils/values_manager.dart';
import 'package:app_store/features/home/domain/entities/banner_entity/home_banner_entity.dart';
import 'package:app_store/features/home/presentation/view/widgets/home_view_body/build_banner_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class GetBannerWidget extends StatelessWidget {
  const GetBannerWidget({Key? key, required this.banners}) : super(key: key);

  final List<BannerEntity> banners;

  @override
  Widget build(BuildContext context) {

    return BuildBannersWidget(banners: banners);
  }
}

class BuildBannersLoading extends StatelessWidget {
  const BuildBannersLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List bannersLoading =[
      Container(),
      Container(),
      Container(),
    ];
    return CarouselSlider(
        items: bannersLoading.map((banner) => SizedBox(
      width: double.infinity,
      child: Card(
        elevation: AppSize.s1_5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
          side: const BorderSide(color: kPrimaryColor,width:AppSize.s1 ),
        ),
        child: Container(
         decoration: BoxDecoration(
             color: Colors.white,
        borderRadius: BorderRadius.circular(AppSize.s12),
        border: Border.all(
            width:AppSize.s1,
            color: kPrimaryColor
        )
      ),
    ),
      ),
    )).toList(),
        options: CarouselOptions(
          height: AppSize.s125,
          autoPlay: true,
          enableInfiniteScroll: true,
          enlargeCenterPage: true,
        ));
  }
}

