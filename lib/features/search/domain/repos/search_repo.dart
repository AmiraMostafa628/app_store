import 'package:app_store/core/errors/failure.dart';
import 'package:app_store/features/search/data/model/search_model.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo{
  Future<Either<Failure,List<SearchProduct>>> fetchSearchDataProducts({required String text});
}