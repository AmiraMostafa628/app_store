import 'package:app_store/features/search/data/model/search_model.dart';

abstract class SearchRemoteDataSource{
  Future <List<SearchProduct>>fetchSearchData({required String text});
}