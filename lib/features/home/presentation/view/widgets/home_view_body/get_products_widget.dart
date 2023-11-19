import 'package:app_store/core/utils/show_toast.dart';
import 'package:app_store/features/home/presentation/view/widgets/home_view_body/build_product_Widget.dart';
import 'package:app_store/features/home/presentation/view_model/home_product_cubit/home_product_cubit.dart';
import 'package:app_store/features/home/presentation/view_model/home_product_cubit/home_product_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toast/toast.dart';

class GetProductsWidget extends StatelessWidget {
  const GetProductsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit,HomeProductStates>(
      listener: (context,state){
        ToastContext().init(context);
        if(state is ChangeFavoriteProductsSuccessStates )
          {
            showToast(text: state.message, state: ToastState.success);
          }
        if(state is ChangeCartProductsSuccessStates )
        {
          showToast(text: state.message, state: ToastState.success);
        }
      },
        builder:(context,state){
          var products = ProductCubit.get(context).product;
          return BuildProductsWidget(products: products);
        });
  }
}




