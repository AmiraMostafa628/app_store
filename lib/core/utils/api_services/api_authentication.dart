import 'package:app_store/core/authentication_models/login_model/login.dart';
import 'package:app_store/core/utils/constants_manager.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'api_authentication.g.dart';

@RestApi(baseUrl:baseUrl)
abstract class AppAuthentication{
  factory AppAuthentication(Dio dio,{String baseUrl}) = _AppAuthentication;

  @POST("login")
  Future<AuthenticationModel> login(
      @Field("email") String email,
      @Field("password") String password,
      );


  @POST("register")
  Future<AuthenticationModel> register(
      @Field("name") String userName,
      @Field("phone") String mobileNumber,
      @Field("email") String email,
      @Field("password") String password,
      @Field("image") String profilePicture,
      );


}