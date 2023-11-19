import 'package:app_store/core/utils/style_manager.dart';
import 'package:app_store/core/utils/values_manager.dart';
import 'package:app_store/features/common/state_renderer.dart';
import 'package:app_store/features/common/state_renderer_impl.dart';
import 'package:app_store/features/home/domain/entities/banner_entity/home_banner_entity.dart';
import 'package:app_store/features/home/presentation/view/widgets/home_view_body/get_banner_widget.dart';
import 'package:app_store/features/home/presentation/view/widgets/home_view_body/get_products_widget.dart';
import 'package:app_store/features/home/presentation/view/widgets/home_view_body/get_title_section.dart';
import 'package:app_store/features/home/presentation/view/widgets/home_view_body/search_section.dart';
import 'package:app_store/features/home/presentation/view_model/home_banner_cubit/home_banner_cubit.dart';
import 'package:app_store/features/home/presentation/view_model/home_banner_cubit/home_banner_states.dart';
import 'package:app_store/features/home/presentation/view_model/home_product_cubit/home_product_cubit.dart';
import 'package:app_store/features/home/presentation/view_model/home_product_cubit/home_product_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<BannerCubit,HomeBannerStates>(
      builder: (context,state){
        var banners=BannerCubit.get(context).banners;
        return StreamBuilder<FlowStates>(
          stream: BannerCubit.get(context).outputState,
          builder: (context,snapshot){
                return snapshot.data?.getScreenWidget(
                context,
                    GetContentWidget(banners: banners,),(){
                  BannerCubit.get(context).fetchHomeBannerData();
                  ProductCubit.get(context).fetchHomeProductsData();
                })??
                    GetContentWidget(banners: banners,);
          },

            );
          },
        );

  }
}

class GetContentWidget extends StatelessWidget {
  const GetContentWidget({Key? key, required this.banners}) : super(key: key);

  final List<BannerEntity> banners;
  @override
  Widget build(BuildContext context) {
   return BlocBuilder<ProductCubit,HomeProductStates>
     (builder: (context,state){
       var products = ProductCubit.get(context).product;
     if(banners.isNotEmpty &&products.isNotEmpty ){
       return CustomScrollView(
           physics: const BouncingScrollPhysics(),
           slivers: [
             SliverToBoxAdapter(
                 child: BuildHomeBody(banners: banners,)
             )
           ]
       )
       ;
     }
     else
     {
       return StateRenderer(
           stateRendererType: StateRendererType.fullScreenLoadingState, retryActionFunction: (){});
     }
   });


  }
}


class BuildHomeBody extends StatelessWidget {
  const BuildHomeBody({
    super.key, required this.banners,
  });

  final List<BannerEntity> banners;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20,vertical: AppPadding.p10),
          child: SearchSection(),
        ),
        GetBannerWidget(banners: banners,),
        const Padding(
          padding: EdgeInsets.only(top: AppPadding.p12,bottom: AppPadding.p2,
              left: AppPadding.p12,right: AppPadding.p12
          ),
          child: GetTitleSection(title: 'Recommended \nfor You',
            textStyle: Styles.testStyle20,),
        ),
        const GetProductsWidget()
      ],
    );
  }
}







