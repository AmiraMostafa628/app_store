import 'package:app_store/core/utils/constants_manager.dart';
import 'package:app_store/core/utils/values_manager.dart';
import 'package:app_store/features/home/domain/entities/banner_entity/home_banner_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BuildBannersWidget extends StatelessWidget {
  const BuildBannersWidget({
  super.key,
  required this.banners,
  });

  final List<BannerEntity> banners;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items:banners.map((banner) => SizedBox(
          width: double.infinity,
          child: Card(
            elevation: AppSize.s1_5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s12),
              side: const BorderSide(color: kPrimaryColor,width:AppSize.s1 ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppSize.s12),
                child:CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: banner.image!,
                  errorWidget: (context,url,error)=>const Icon(Icons.error,color: Colors.red,),
                )
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