import 'package:app_store/core/utils/api_services/api_authentication.dart';
import 'package:app_store/core/utils/api_services/api_service.dart';
import 'package:app_store/core/utils/dio/dio_auth.dart';
import 'package:app_store/core/utils/dio/dio_helper.dart';
import 'package:app_store/features/home/data/remote_data_source/remote_data_source_impl.dart';
import 'package:app_store/features/home/data/repos/cart_repo_impl.dart';
import 'package:app_store/features/home/data/repos/fav_repo_impl.dart';
import 'package:app_store/features/home/data/repos/home_repo_impl.dart';
import 'package:app_store/features/home/data/repos/user_data_repo_impl.dart';
import 'package:app_store/features/login/data/remote_data_source/login_remote_data_source_impl.dart';
import 'package:app_store/features/login/data/repos/repo_impl.dart';
import 'package:app_store/features/register/data/remote_data_source/register_remote_data_source_impl.dart';
import 'package:app_store/features/register/data/repos/repo_impl.dart';
import 'package:app_store/features/search/data/remote_data_source/remote_data_source_impl.dart';
import 'package:app_store/features/search/data/repos/search_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

GetIt instance = GetIt.instance;

Future<void> initAppModule() async {


  instance.registerLazySingleton<DioAuth>(() => DioAuth());

  Dio dioAuth = await instance<DioAuth>().init();


  instance.registerSingleton<AppAuthentication>(AppAuthentication(dioAuth));

  instance.registerLazySingleton<RegisterRepoImpl>(()=> RegisterRepoImpl(
    registerRemoteDataSource: RegisterRemoteDataSourceImpl(
      instance.get<AppAuthentication>(),
    ),),);

  instance.registerLazySingleton<LoginRepoImpl>(()=>LoginRepoImpl(
    loginRemoteDataSource: LoginRemoteDataSourceImpl(
      instance.get<AppAuthentication>(),
    ),));






}





initMainModule() async {
  if (!GetIt.I.isRegistered<DioHelper>()) {

    instance.registerLazySingleton<DioHelper>(() => DioHelper());

    Dio dio = await instance<DioHelper>().init();

    instance.registerSingleton<AppServiceClient>(AppServiceClient(dio));

    instance.registerFactory<HomeRepoImpl>(()=>
        HomeRepoImpl(
          homeRemoteDataSource: HomeRemoteDataSourceImpl(
            instance.get<AppServiceClient>(),
          ),),
    );

    instance.registerFactory<FavRepoImpl>(()=>
        FavRepoImpl(
          homeRemoteDataSource: HomeRemoteDataSourceImpl(
            instance.get<AppServiceClient>(),
          ),),
    );
    instance.registerFactory<CartRepoImpl>(()=>
        CartRepoImpl(
          homeRemoteDataSource: HomeRemoteDataSourceImpl(
            instance.get<AppServiceClient>(),
          ),),
    );

    instance.registerFactory<SearchRepoImpl>(()=>
        SearchRepoImpl(
          searchRemoteDataSource: SearchRemoteDataSourceImpl(
            instance.get<AppServiceClient>(),
          ),),
    );

    instance.registerFactory<UserDataRepoImpl>(()=>
        UserDataRepoImpl(
            homeRemoteDataSource: HomeRemoteDataSourceImpl(
              instance.get<AppServiceClient>(),
            )
        ),
    );


  }
}
