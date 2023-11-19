import 'package:app_store/core/authentication_models/login_model/login.dart';
import 'package:app_store/core/errors/failure.dart';
import 'package:app_store/core/use_cases/use_case.dart';
import 'package:app_store/features/register/domain/repos/register_repo.dart';
import 'package:app_store/features/register/domain/request/requests.dart';
import 'package:dartz/dartz.dart';

class RegisterUseCase extends UseCase<AuthenticationModel,RegisterRequest>{
  final RegisterRepo _registerRepo;

  RegisterUseCase(this._registerRepo);

  @override
  Future<Either<Failure, AuthenticationModel>> execute( param) async {
    return await _registerRepo.fetchRegisterAuthentications(
        userName: param.userName,phone: param.phone,
        email: param.email, password: param.password);
  }

}