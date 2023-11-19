import 'package:app_store/core/errors/failure.dart';
import 'package:app_store/core/use_cases/use_case.dart';
import 'package:app_store/features/home/domain/entities/fav_cart_entity/fav_cart_entity.dart';
import 'package:app_store/features/home/domain/repos/cart_repo.dart';
import 'package:dartz/dartz.dart';

class CartUseCase extends UseCase<List<FavCartProductEntity>,NoParam>{
  final CartRepo _cartRepo;

  CartUseCase(this._cartRepo);

  @override
  Future<Either<Failure, List<FavCartProductEntity>>> execute([NoParam? param]) async {
    return await _cartRepo.fetchCartProducts();
  }

}