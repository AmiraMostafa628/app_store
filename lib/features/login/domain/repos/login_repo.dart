import 'package:app_store/core/authentication_models/login_model/login.dart';
import 'package:app_store/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class LoginRepo{
  Future<Either<Failure,AuthenticationModel>> fetchLoginAuthentications(
  {
    required String email,
    required String password,});
}
