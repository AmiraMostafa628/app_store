import 'package:app_store/core/errors/failure.dart';
import 'package:app_store/core/use_cases/use_case.dart';
import 'package:app_store/features/home/data/models/change_fav_cart_model.dart';
import 'package:app_store/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class ChangeFavoriteProductsUseCase extends UseCase<ChangeFavCartModel,int>{
  final HomeRepo _homeRepo;

  ChangeFavoriteProductsUseCase(this._homeRepo);

  @override
  Future<Either<Failure, ChangeFavCartModel>> execute(int param) async {
    return await _homeRepo.changeFavoriteProducts(param);
  }

}