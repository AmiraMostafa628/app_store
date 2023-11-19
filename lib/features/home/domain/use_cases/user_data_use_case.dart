import 'package:app_store/core/authentication_models/login_model/login.dart';
import 'package:app_store/core/errors/failure.dart';
import 'package:app_store/core/use_cases/use_case.dart';
import 'package:app_store/features/home/domain/repos/user_data_repo.dart';
import 'package:dartz/dartz.dart';

class UserDataUseCase extends UseCase<AuthenticationModel,NoParam>{
  final UserDataRepo _userDataRepo;

  UserDataUseCase(this._userDataRepo);

  @override
  Future<Either<Failure,AuthenticationModel>> execute([NoParam? param]) async {
    return await _userDataRepo.fetchUserData();
  }

}