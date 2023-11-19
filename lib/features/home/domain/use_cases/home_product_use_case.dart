import 'package:app_store/core/errors/failure.dart';
import 'package:app_store/core/use_cases/use_case.dart';
import 'package:app_store/features/home/domain/entities/product_entity/home_products_entity.dart';
import 'package:app_store/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeProductsUseCase extends UseCase<List<ProductEntity>,NoParam>{
  final HomeRepo _homeRepo;

   HomeProductsUseCase(this._homeRepo);

  @override
  Future<Either<Failure, List<ProductEntity>>> execute([NoParam? param]) async {
    return await _homeRepo.fetchHomeDataProducts();
  }

}