import 'package:app_store/core/errors/failure.dart';
import 'package:app_store/features/search/data/model/search_model.dart';
import 'package:app_store/features/search/data/remote_data_source/remote_data_source.dart';
import 'package:app_store/features/search/domain/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl extends SearchRepo{
  final SearchRemoteDataSource searchRemoteDataSource;

  SearchRepoImpl({required this.searchRemoteDataSource});

  @override
  Future<Either<Failure, List<SearchProduct>>> fetchSearchDataProducts(
      {required String text}) async{
    try{
      List<SearchProduct> searchData =
      await searchRemoteDataSource.fetchSearchData(text: text);
      return right(searchData);
    }catch(error){
      if(error is DioError)
      {
        return left(ServerFailure.fromDioError(error));
      }
      else
      {
        return left(ServerFailure(error.toString()));
      }

    }
  }
}