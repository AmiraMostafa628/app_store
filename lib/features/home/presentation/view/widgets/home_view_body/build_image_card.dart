import 'package:app_store/core/utils/constants_manager.dart';
import 'package:app_store/core/utils/values_manager.dart';
import 'package:app_store/features/home/domain/entities/product_entity/home_products_entity.dart';
import 'package:app_store/features/home/presentation/view_model/home_product_cubit/home_product_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BuildImageCard extends StatelessWidget {
  const BuildImageCard({
  super.key,
  required this.product
  });

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        SizedBox(
          height: AppSize.s125,
          child: Card(
            elevation: AppSize.s4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s12),
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: AppPadding.p8,
                  right:AppPadding.p8,
                  left:AppPadding.p8
              ),
                child:CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: product.image!,
                  height: AppSize.s80,
                  errorWidget: (context,url,error)=>const Icon(Icons.error,color: Colors.red,),
                ),
            ),
          ),
        ),
        IconButton(onPressed: (){
          ProductCubit.get(context).changeFavorites(product.id!, context);
        },
            icon:  Padding(
              padding: const EdgeInsets.only(bottom: AppPadding.p16,left:AppPadding.p16 ),
              child: ProductCubit.get(context).favorites[product.id]==true? const Icon(FontAwesomeIcons.solidHeart,
                color: kPrimaryColor,
                size: AppSize.s16,
              ):const Icon(FontAwesomeIcons.heart,
                color: kPrimaryColor,
                size: AppSize.s16,
              ),
            )
        )
      ],
    );
  }
}