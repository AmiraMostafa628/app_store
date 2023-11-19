import 'package:app_store/core/utils/di.dart';
import 'package:app_store/features/home/data/repos/cart_repo_impl.dart';
import 'package:app_store/features/home/data/repos/fav_repo_impl.dart';
import 'package:app_store/features/home/data/repos/home_repo_impl.dart';
import 'package:app_store/features/home/data/repos/user_data_repo_impl.dart';
import 'package:app_store/features/home/domain/entities/product_entity/home_products_entity.dart';
import 'package:app_store/features/home/domain/use_cases/cart_use_case.dart';
import 'package:app_store/features/home/domain/use_cases/change_cart_use_case.dart';
import 'package:app_store/features/home/domain/use_cases/change_fav_use_case.dart';
import 'package:app_store/features/home/domain/use_cases/fav_use_case.dart';
import 'package:app_store/features/home/domain/use_cases/home_banner_use_case.dart';
import 'package:app_store/features/home/domain/use_cases/home_product_use_case.dart';
import 'package:app_store/features/home/domain/use_cases/user_data_use_case.dart';
import 'package:app_store/features/home/presentation//view/home_view.dart';
import 'package:app_store/features/home/presentation/view/widgets/home_view_body/build_store_details/store_details_body.dart';
import 'package:app_store/features/home/presentation/view/widgets/setting_view_body/user_data/view_model/cubit/user_data_cubit.dart';
import 'package:app_store/features/home/presentation/view_model/cart_cubit/cart_cubit.dart';
import 'package:app_store/features/home/presentation/view_model/fav_cubit/fav_cubit.dart';
import 'package:app_store/features/home/presentation/view_model/home_banner_cubit/home_banner_cubit.dart';
import 'package:app_store/features/home/presentation/view_model/home_product_cubit/home_product_cubit.dart';
import 'package:app_store/features/login/data/repos/repo_impl.dart';
import 'package:app_store/features/login/domain/usecase/login_usecase.dart';
import 'package:app_store/features/login/presentation/view/login_view.dart';
import 'package:app_store/features/login/presentation/view_model/login_cubit/login_cubit.dart';
import 'package:app_store/features/register/data/repos/repo_impl.dart';
import 'package:app_store/features/register/domain/usecase/register_use_case.dart';
import 'package:app_store/features/register/presentation/view/register_view.dart';
import 'package:app_store/features/register/presentation/view_model/register_cubit/register_cubit.dart';
import 'package:app_store/features/search/data/repos/search_repo_impl.dart';
import 'package:app_store/features/search/domain/use_cases/search_use_case.dart';
import 'package:app_store/features/search/presentation/view/search_view.dart';
import 'package:app_store/features/search/presentation/view_model/cubit/search_cubit.dart';
import 'package:app_store/features/splash/presentation/view/splash_view.dart';
import 'package:app_store/features/verify_phone/presentation/view/verify_phone_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter{

  static String kLogin = '/login';
  static String kRegister = '/register';
  static String kVerifyPhone = '/verifyPhone';
  static String kHome = '/home';
  static String kStoreDetails = '/storeDetails';
  static String kSearch = '/search';

  static final GoRouter router = GoRouter(
    routes:[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: '/login',
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (BuildContext context)=>LoginCubit(
              LoginUseCase(instance.get<LoginRepoImpl>())
            ),
              child: const LoginView());
        },
      ),
      GoRoute(
        path: '/register',
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
              create: (BuildContext context)=>RegisterCubit(
                  RegisterUseCase(instance.get<RegisterRepoImpl>())),
              child: const RegisterView());
        },
      ),
      GoRoute(
        path: '/verifyPhone',
        builder: (BuildContext context, GoRouterState state) {
          return const VerifyPhoneView();
        },
      ),
      GoRoute(
        path: '/home',
        builder: (BuildContext context, GoRouterState state) {
          return  MultiBlocProvider(
            providers: [
              BlocProvider(create: (BuildContext context)=>
                  BannerCubit(
                      HomeBannerUseCase(instance.get<HomeRepoImpl>()))..fetchHomeBannerData()
              ),
              BlocProvider(
                  create: (BuildContext context)=>ProductCubit(
                    HomeProductsUseCase(instance.get<HomeRepoImpl>()),
                    ChangeFavoriteProductsUseCase(instance.get<HomeRepoImpl>()),
                    ChangeCartProductsUseCase(instance.get<HomeRepoImpl>()),
                  )..fetchHomeProductsData()
              ),
              BlocProvider(
                  create: (BuildContext context)=>FavoriteCubit(
                      FavoriteUseCase(instance.get<FavRepoImpl>()))..fetchFavData()
              ),
              BlocProvider(
                  create: (BuildContext context)=>CartCubit(
                      CartUseCase(instance.get<CartRepoImpl>()))..fetchCartData()
              ),
              BlocProvider(
                  create: (BuildContext context)=>UserDataCubit(
                      UserDataUseCase(instance.get<UserDataRepoImpl>()))..fetchUserData()
              ),
            ],
              child: const HomeView());
        },
      ),
      GoRoute(
        path: '/storeDetails',
        builder: (BuildContext context, GoRouterState state) {
          return  StoreDetailsBody(product: state.extra as ProductEntity,);
        },
      ),
      GoRoute(
        path: '/search',
        builder: (BuildContext context, GoRouterState state) {
          return  BlocProvider<SearchCubit>.value(
             value: SearchCubit(SearchProductsUseCase(instance.get<SearchRepoImpl>()))
               ..fetchSearchData(text: state.extra as String),
              child: SearchView(searchText: state.extra as String,));
        },
      ),
    ],
  );
}

