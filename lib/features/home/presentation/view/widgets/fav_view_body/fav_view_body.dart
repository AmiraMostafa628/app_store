import 'package:app_store/core/utils/style_manager.dart';
import 'package:app_store/core/utils/values_manager.dart';
import 'package:app_store/features/common/state_renderer.dart';
import 'package:app_store/features/home/presentation/view/widgets/fav_view_body/build_List_view_fav.dart';
import 'package:app_store/features/home/presentation/view_model/fav_cubit/fav_cubit.dart';
import 'package:app_store/features/home/presentation/view_model/fav_cubit/fav_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavViewBody extends StatelessWidget {
  const FavViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit,FavoriteStates>(
      builder:(context,state){
        var favProducts= FavoriteCubit.get(context).favorites;
        if(state is FavoriteSuccessStates){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p14,vertical: AppPadding.p14),
                child: Text('Favorite Products',
                  style: Styles.testStyle20.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600
                  ),
                ),
              ),
              Expanded(child: BuildListFavBody(favProducts: favProducts,)),
            ],
          );
        }

        else if (state is FavoriteErrorStates){
          return StateRenderer(
              stateRendererType: StateRendererType.fullScreenErrorState,
              message: state.errMessage,
              retryActionFunction: (){
                FavoriteCubit.get(context).fetchFavData();
              });
        }

        else{
          return StateRenderer(
              stateRendererType: StateRendererType.fullScreenLoadingState, retryActionFunction: (){});
        }
    }
    );
  }
}

