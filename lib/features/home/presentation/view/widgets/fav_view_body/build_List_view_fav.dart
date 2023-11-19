import 'package:app_store/core/utils/constants_manager.dart';
import 'package:app_store/core/utils/style_manager.dart';
import 'package:app_store/core/utils/values_manager.dart';
import 'package:app_store/features/home/domain/entities/fav_cart_entity/fav_cart_entity.dart';
import 'package:app_store/features/home/presentation/view_model/home_product_cubit/home_product_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class BuildListFavBody extends StatelessWidget {
  const BuildListFavBody({
  super.key, required this.favProducts,
  });

  final List<FavCartProductEntity> favProducts;

  @override
  Widget build(BuildContext context) {
     if(favProducts.isNotEmpty){
       return Padding(
         padding: const EdgeInsets.only(left: AppPadding.p12,right: AppPadding.p12),
         child: ListView(
           scrollDirection: Axis.vertical,
           children: favProducts.map((favorite) => SizedBox(
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
                         imageUrl: favorite.image!,
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
                               favorite.name!,
                               maxLines: 2,
                               overflow: TextOverflow.ellipsis,
                               style:Styles.testStyle14.copyWith(
                                 color: Colors.black,
                               )

                           ),
                           Expanded(
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Center(
                                   child: Text(
                                       favorite.price.toString(),
                                       style: Styles.testStyle12.copyWith(
                                           height: AppSize.s2_5
                                       )
                                   ),
                                 ),
                                 SizedBox(
                                   height: AppSize.s20,
                                   child: IconButton(onPressed: (){
                                     ProductCubit.get(context).changeFavorites(favorite.id!, context);
                                   },
                                     icon:const Icon(FontAwesomeIcons.solidHeart,
                                       color: kPrimaryColor,
                                       size: AppSize.s16,
                                     ),
                                   ),
                                 )
                               ],
                             ),
                           ),
                         ],
                       ),
                     ),
                   ],
                 ),
               ),
             ),
           )).toList(),
         ),
       );
     }
     else
       {
         return  Center(child: Text('No Favorites Yet',
           style: Styles.testStyle16.copyWith(
             color: kPrimaryColor
           ),
         )
         );
       }
  }
}