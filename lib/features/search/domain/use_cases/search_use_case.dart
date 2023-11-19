import 'package:app_store/core/errors/failure.dart';
import 'package:app_store/core/use_cases/use_case.dart';
import 'package:app_store/features/search/data/model/search_model.dart';
import 'package:app_store/features/search/domain/repos/search_repo.dart';
import 'package:dartz/dartz.dart';

class SearchProductsUseCase extends UseCase<List<SearchProduct>,String>{
  final SearchRepo _searchRepo;

  SearchProductsUseCase(this._searchRepo);

  @override
  Future<Either<Failure, List<SearchProduct>>> execute(String param) async {
    return await _searchRepo.fetchSearchDataProducts(text: param);
  }

}