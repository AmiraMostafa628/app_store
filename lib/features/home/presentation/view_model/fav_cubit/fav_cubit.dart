import 'dart:async';
import 'package:app_store/features/home/domain/entities/fav_cart_entity/fav_cart_entity.dart';
import 'package:app_store/features/home/domain/use_cases/fav_use_case.dart';
import 'package:app_store/features/home/presentation/view_model/fav_cubit/fav_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteCubit extends Cubit<FavoriteStates> {

  FavoriteCubit(this._favoriteUseCase): super(FavoriteInitialState());

  static FavoriteCubit get(context)=>BlocProvider.of(context);

  final FavoriteUseCase _favoriteUseCase;


  List<FavCartProductEntity> favorites=[];

  Future<void> fetchFavData()async {
    emit((FavoriteLoadingStates()));

    var result = await _favoriteUseCase.execute();

    result.fold((failure) {
      emit(FavoriteErrorStates(failure.errMessage));
    }, (favoriteEntity){
      favorites=favoriteEntity;
      emit(FavoriteSuccessStates(favoriteEntity));


    });

  }



}