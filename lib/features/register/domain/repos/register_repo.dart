import 'package:app_store/core/authentication_models/login_model/login.dart';
import 'package:app_store/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class RegisterRepo{
  Future<Either<Failure,AuthenticationModel>> fetchRegisterAuthentications(
  {
    required String userName,
    required String phone,
    required String email,
    required String password,});
}
