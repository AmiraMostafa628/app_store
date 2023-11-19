import 'dart:async';
import 'package:app_store/features/home/domain/entities/fav_cart_entity/fav_cart_entity.dart';
import 'package:app_store/features/home/domain/use_cases/cart_use_case.dart';
import 'package:app_store/features/home/presentation/view_model/cart_cubit/cart_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartStates>{

  CartCubit(this._cartUseCase): super(CartInitialState());

  static CartCubit get(context)=>BlocProvider.of(context);

  final CartUseCase _cartUseCase;


  List<FavCartProductEntity> carts=[];

  Future<void> fetchCartData()async {
    emit((CartLoadingStates()));

    var result = await _cartUseCase.execute();

    result.fold((failure) {
      emit(CartErrorStates(failure.errMessage));
    }, (cartEntity){
      carts=cartEntity;
      emit(CartSuccessStates(cartEntity));


    });

  }




}