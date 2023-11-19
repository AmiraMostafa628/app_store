import 'package:app_store/core/utils/api_services/api_service.dart';
import 'package:app_store/features/search/data/model/search_model.dart';
import 'package:app_store/features/search/data/remote_data_source/remote_data_source.dart';

class SearchRemoteDataSourceImpl extends SearchRemoteDataSource{

  final AppServiceClient _appServiceClient;

  SearchRemoteDataSourceImpl(this._appServiceClient);

  @override
  Future<List<SearchProduct>> fetchSearchData({required String text}) async{
    var data = await _appServiceClient.getSearchData(text);
    return data.data?.data?? [];
  }

}