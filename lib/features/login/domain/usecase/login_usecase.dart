import 'package:app_store/core/authentication_models/login_model/login.dart';
import 'package:app_store/core/errors/failure.dart';
import 'package:app_store/core/use_cases/use_case.dart';
import 'package:app_store/features/login/domain/repos/login_repo.dart';
import 'package:app_store/features/login/domain/request/requests.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase extends UseCase<AuthenticationModel,LoginRequest>{
  final LoginRepo _loginRepo;

  LoginUseCase(this._loginRepo);

  @override
  Future<Either<Failure, AuthenticationModel>> execute(LoginRequest param) async {
    return await _loginRepo.fetchLoginAuthentications(
        email: param.email, password: param.password);
  }

}