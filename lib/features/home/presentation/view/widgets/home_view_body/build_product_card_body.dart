import 'package:app_store/core/utils/constants_manager.dart';
import 'package:app_store/core/utils/style_manager.dart';
import 'package:app_store/core/utils/values_manager.dart';
import 'package:app_store/features/home/domain/entities/product_entity/home_products_entity.dart';
import 'package:app_store/features/home/presentation/view/widgets/home_view_body/get_title_section.dart';
import 'package:flutter/material.dart';

class BuildCardBody extends StatelessWidget {
  const BuildCardBody({
  super.key, required this.productEntity,
  });
  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GetTitleSection(
            title: productEntity.name!,
            textStyle:Styles.testStyle16.copyWith(
                color: Colors.black
            ),
          ),
          const SizedBox(height: 10,),
          GetTitleSection(
              title:'${productEntity.price!}',
              textStyle: Styles.testStyle10
          ),
          if(productEntity.disCount !=0)
            Text(
                '${productEntity.oldPrice?.round()}',
                style: Styles.testStyle10.copyWith(
                    decoration: TextDecoration.lineThrough,
                    color: kPrimaryColor
                )
            ),
        ],
      ),
    );
  }
}