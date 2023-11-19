import 'package:app_store/core/utils/style_manager.dart';
import 'package:app_store/core/utils/values_manager.dart';
import 'package:app_store/features/common/state_renderer.dart';
import 'package:app_store/features/home/presentation/view/widgets/cart_view_body/build_list_view_cart.dart';
import 'package:app_store/features/home/presentation/view_model/cart_cubit/cart_cubit.dart';
import 'package:app_store/features/home/presentation/view_model/cart_cubit/cart_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit,CartStates>(
        builder:(context,state){
          var cartProducts = CartCubit.get(context).carts;
          if(state is CartSuccessStates){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppPadding.p14,vertical: AppPadding.p14),
                  child: Text('Shopping Cart',
                    style: Styles.testStyle20.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ),
                Expanded(child: BuildListCartBody(cartProducts: cartProducts,)),
              ],
            );
          }

          else if (state is CartErrorStates){
            return StateRenderer(
                stateRendererType: StateRendererType.fullScreenErrorState,
                message: state.errMessage,
                retryActionFunction: (){
                  CartCubit.get(context).fetchCartData();
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
