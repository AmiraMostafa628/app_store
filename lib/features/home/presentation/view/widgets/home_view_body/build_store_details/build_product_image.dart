import 'package:app_store/core/utils/values_manager.dart';
import 'package:app_store/features/home/domain/entities/product_entity/home_products_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BuildProductImage extends StatelessWidget {
  const BuildProductImage({Key? key, required this.product}) : super(key: key);

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          bottom: AppPadding.p8),
      child: SizedBox(
        height: AppSize.s190,
        width: double.infinity,
        child: Card(
          elevation: AppSize.s4,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CachedNetworkImage(
              imageUrl: product.image!,
              height: AppSize.s190,
              errorWidget: (context,url,error)=>const Icon(Icons.error,color: Colors.red,),
            ),
          ),
        ),
      ),
    );
  }
}