import 'package:app_store/core/utils/app_router.dart';
import 'package:app_store/core/utils/style_manager.dart';
import 'package:app_store/core/utils/values_manager.dart';
import 'package:app_store/features/search/data/model/search_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BuildListSearchBody extends StatelessWidget {
  const BuildListSearchBody({
  super.key, required this.searchProducts,
  });

  final List<SearchProduct> searchProducts;

  @override
  Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.only(left: AppPadding.p12,right: AppPadding.p12),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: searchProducts.map((searchData) => GestureDetector(
            onTap: (){
              GoRouter.of(context).push(AppRouter.kStoreDetails,extra: searchData);
            },
            child: SizedBox(
              height: AppSize.s110,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.s12),
                  side: const BorderSide(color: Colors.white,width:AppSize.s1 ),

                ),
                child: Padding(
                  padding: const EdgeInsets.all(AppPadding.p12),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(AppSize.s12),
                        child: CachedNetworkImage(
                          imageUrl: searchData.image?? '',
                          height: AppSize.s110,
                          width: AppSize.s110,
                          errorWidget: (context,url,error)=>const Icon(Icons.error,color: Colors.red,),
                        ),
                      ),
                      const SizedBox(
                        width: AppSize.s20,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                searchData.name!,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style:Styles.testStyle14.copyWith(
                                  color: Colors.black,
                                )

                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                    searchData.price.toString(),
                                    style: Styles.testStyle12.copyWith(
                                        height: AppSize.s2_5
                                    )
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )).toList(),
        ),
      );



  }
}