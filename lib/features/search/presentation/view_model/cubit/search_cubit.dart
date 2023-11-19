import 'package:app_store/features/search/data/model/search_model.dart';
import 'package:app_store/features/search/domain/use_cases/search_use_case.dart';
import 'package:app_store/features/search/presentation/view_model/cubit/search_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchStates>{

  SearchCubit(this._searchProductsUseCase): super(SearchInitialState());

  static SearchCubit get(context)=>BlocProvider.of(context);

  final SearchProductsUseCase _searchProductsUseCase;


  List<SearchProduct> searchData=[];

  Future<void> fetchSearchData({required String text})async {
    emit((SearchLoadingStates()));

    var result = await _searchProductsUseCase.execute(text);

    result.fold((failure) {
      emit(SearchErrorStates(failure.errMessage));
    }, (searchEntity){
      searchData=searchEntity;
      emit(SearchSuccessStates(searchData));
    });

  }




}