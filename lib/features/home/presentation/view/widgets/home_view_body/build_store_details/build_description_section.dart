import 'package:app_store/core/utils/constants_manager.dart';
import 'package:app_store/core/utils/style_manager.dart';
import 'package:app_store/core/utils/values_manager.dart';
import 'package:app_store/features/home/domain/entities/product_entity/home_products_entity.dart';
import 'package:flutter/material.dart';

class DescriptionSection extends StatelessWidget {
  const DescriptionSection({
  super.key,
  required this.product,
  });

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              vertical: AppPadding.p8,horizontal: AppPadding.p10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Description',
                style: Styles.testStyle18.copyWith(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w600
                ),
              ),
              Container(
                width: 70,
                height: 30,
                decoration: BoxDecoration(
                  color: kPrimaryColor.withOpacity(.9),
                  borderRadius: BorderRadius.circular(AppSize.s10),
                ),
                child: Center(
                  child: Text('${product.price} £',
                    style: Styles.testStyle16,
                  ),
                ),
              ),


            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('${product.description}',
            style: Styles.testStyle16.copyWith(
                color: Colors.black
            ),
          ),
        ),
      ],
    );
  }
}