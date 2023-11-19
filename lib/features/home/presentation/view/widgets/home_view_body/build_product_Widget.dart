import 'package:app_store/core/utils/app_router.dart';
import 'package:app_store/core/utils/values_manager.dart';
import 'package:app_store/core/widgets/build_box_decoration.dart';
import 'package:app_store/features/home/domain/entities/product_entity/home_products_entity.dart';
import 'package:app_store/features/home/presentation/view/widgets/home_view_body/build_image_card.dart';
import 'package:app_store/features/home/presentation/view/widgets/home_view_body/build_product_card_body.dart';
import 'package:app_store/features/home/presentation/view_model/home_product_cubit/home_product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class BuildProductsWidget extends StatelessWidget {
  const BuildProductsWidget({
  super.key,
  required this.products,
  });

  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppPadding.p12,
          left: AppPadding.p12,right: AppPadding.p12
      ),
      child: Flex(
        direction: Axis.vertical,
        children: [
          GridView.count(
            crossAxisCount: AppSize.s2,
            crossAxisSpacing: AppSize.s5,
            mainAxisSpacing: AppSize.s5,
            childAspectRatio: .58,
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            children: List.generate(products.length,(index){
              return InkWell(
                onTap: (){
                 GoRouter.of(context).push(AppRouter.kStoreDetails,extra: products[index]);
                },
                child: Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    Card(
                      elevation: AppSize.s4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSize.s12),
                        side: const BorderSide(color: Colors.white,width:AppSize.s1 ),

                      ),
                      child: Column(
                        children: [
                          BuildImageCard(product: products[index],),
                          BuildCardBody(productEntity: products[index],)

                        ],
                      ),
                    ),
                    buildGestureDetector(context, index)

                  ],
                ),
              );
            }),
          )
        ],
      ),
    );
  }



  GestureDetector buildGestureDetector(BuildContext context, int index) {
    return GestureDetector(
                    onTap: (){
                      ProductCubit.get(context).changeCart(products[index].id!, context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: AppPadding.p4,bottom: AppPadding.p4),
                      child: Container(
                        height: AppSize.s25,
                        width: AppSize.s25,
                        decoration: BoxDecoration(
                            gradient: buildBoxGradient(),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(AppSize.s10),
                                bottomRight: Radius.circular(AppSize.s10)
                            )
                        ),
                        child: ProductCubit.get(context).cart[products[index].id!]
                            ==true?const Icon(
                            FontAwesomeIcons.check,
                            color: Colors.white,
                            size: AppSize.s14
                        ):const Icon(
                            FontAwesomeIcons.plus,
                            color: Colors.white,
                            size: AppSize.s14
                        )
                      ),
                    ),
                  );
  }
}