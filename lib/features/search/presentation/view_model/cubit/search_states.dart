import 'package:app_store/features/search/data/model/search_model.dart';

abstract class SearchStates{}

class SearchInitialState extends SearchStates {}

class SearchLoadingStates extends SearchStates{}

class SearchSuccessStates extends SearchStates{
  final List<SearchProduct> searchData;

  SearchSuccessStates(this.searchData);
}

class SearchErrorStates extends SearchStates{
  final String errMessage;

  SearchErrorStates(this.errMessage);
}