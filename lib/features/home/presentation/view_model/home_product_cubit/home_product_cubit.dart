import 'dart:async';
import 'package:app_store/features/common/state_renderer.dart';
import 'package:app_store/features/common/state_renderer_impl.dart';
import 'package:app_store/features/home/domain/entities/product_entity/home_products_entity.dart';
import 'package:app_store/features/home/domain/use_cases/change_cart_use_case.dart';
import 'package:app_store/features/home/domain/use_cases/change_fav_use_case.dart';
import 'package:app_store/features/home/domain/use_cases/home_product_use_case.dart';
import 'package:app_store/features/home/presentation/view_model/base_view_model/base_view_model.dart';
import 'package:app_store/features/home/presentation/view_model/cart_cubit/cart_cubit.dart';
import 'package:app_store/features/home/presentation/view_model/fav_cubit/fav_cubit.dart';
import 'package:app_store/features/home/presentation/view_model/home_product_cubit/home_product_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<HomeProductStates> implements BaseViewModel{

  ProductCubit(this._productsUseCase, this._changeFavoriteProductsUseCase, this._changeCartProductsUseCase): super(HomeProductInitialState());

  static ProductCubit get(context)=>BlocProvider.of(context);

 final HomeProductsUseCase _productsUseCase;
 final ChangeFavoriteProductsUseCase _changeFavoriteProductsUseCase;
 final ChangeCartProductsUseCase _changeCartProductsUseCase;


 List<ProductEntity> product=[];
  Map<dynamic,dynamic> favorites ={};
  Map<dynamic,dynamic> cart ={};


  Future<void> fetchHomeProductsData()async {
    inputState.add(LoadingState(stateRendererType: StateRendererType.fullScreenLoadingState));
    emit(HomeProductLoadingStates());
    var result = await _productsUseCase.execute();

    result.fold((failure) {
      inputState.add(ErrorState(StateRendererType.fullScreenErrorState,
          failure.errMessage));
      emit(HomeProductErrorStates(failure.errMessage));
    }, (productEntity){
      product=productEntity;
      getFavCartProducts(productEntity);
      inputState.add(ContentState());
      emit(HomeProductSuccessStates(productEntity));


    });

  }

  void getFavCartProducts(List<ProductEntity> productEntity) {
    for (var element in productEntity) {
      favorites.addAll(
          {element.id: element.inFavorites});
      cart.addAll(
          {element.id: element.inCart});
    }
  }

  Future<void> changeFavorites(int productId,context)async{
    favorites[productId] = !favorites[productId];
    (await _changeFavoriteProductsUseCase.execute(productId)).fold(
            (failure){
              favorites[productId] = !favorites[productId];
              emit(ChangeFavoriteProductsErrorStates());
              },
            (data) async {
          await FavoriteCubit.get(context).fetchFavData();
          if(!data.status!)
          {
            favorites[productId] = !favorites[productId];
            emit(ChangeFavoriteProductsSuccessStates(data.message!));
          }
          else
          {
           await FavoriteCubit.get(context).fetchFavData();
            emit(ChangeFavoriteProductsSuccessStates(data.message!));

          }
        });


  }

  Future<void> changeCart(int productId,context)async{
    cart[productId] = !cart[productId];
    (await _changeCartProductsUseCase.execute(productId)).fold(
            (failure) {
              cart[productId] = !cart[productId];
              emit(ChangeCartProductsErrorStates());
            },
            (data)async {
             await CartCubit.get(context).fetchCartData();
          if(!data.status!)
          {
            cart[productId] = !cart[productId];
            emit(ChangeCartProductsSuccessStates(data.message!));
          }
          else
          {
             await CartCubit.get(context).fetchCartData();
            emit(ChangeCartProductsSuccessStates(data.message!));

          }
        });


  }


  @override
  void dispose() {
    inputStreamController.close();
  }

  @override
  StreamController inputStreamController = StreamController<FlowStates>.broadcast();

  @override
  Stream<FlowStates> get outputState
  => inputStreamController.stream.map((flowState) => flowState);

  @override
  Sink get inputState => inputStreamController.sink;



}