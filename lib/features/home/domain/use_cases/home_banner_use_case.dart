import 'package:app_store/core/errors/failure.dart';
import 'package:app_store/core/use_cases/use_case.dart';
import 'package:app_store/features/home/domain/entities/banner_entity/home_banner_entity.dart';
import 'package:app_store/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeBannerUseCase extends UseCase<List<BannerEntity>,NoParam>{
  final HomeRepo _homeRepo;

  HomeBannerUseCase(this._homeRepo);

  @override
  Future<Either<Failure, List<BannerEntity>>> execute([NoParam? param]) async {
    return await _homeRepo.fetchHomeDataBanners();
  }

}