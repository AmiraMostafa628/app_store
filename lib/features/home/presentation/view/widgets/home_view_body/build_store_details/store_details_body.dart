import 'package:app_store/core/utils/constants_manager.dart';
import 'package:app_store/features/home/domain/entities/product_entity/home_products_entity.dart';
import 'package:app_store/features/home/presentation/view/widgets/home_view_body/build_store_details/build_description_section.dart';
import 'package:app_store/features/home/presentation/view/widgets/home_view_body/build_store_details/build_list_view_images.dart';
import 'package:app_store/features/home/presentation/view/widgets/home_view_body/build_store_details/build_product_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class StoreDetailsBody extends StatelessWidget {
  const StoreDetailsBody({Key? key, required this.product}) : super(key: key);

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(onPressed: (){
                    GoRouter.of(context).pop();
                  },
                    icon: const Icon(FontAwesomeIcons.angleLeft),
                    color: kPrimaryColor,
                  ),
                  BuildProductImage(product: product,),
                  SizedBox(
                      height: 100,
                      child: BuildListViewImages(product: product,)),
                  DescriptionSection(product: product)

                ],
              ),
            )
          ],

        ),
      ),
    );
  }
}





