import 'package:app_store/core/utils/app_router.dart';
import 'package:app_store/core/utils/bloc_observer.dart';
import 'package:app_store/core/utils/cache_helper.dart';
import 'package:app_store/core/utils/di.dart';
import 'package:app_store/core/utils/theme_Manager.dart';
import 'package:app_store/features/home/presentation/view_model/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await AppPreferences.init();
  await initAppModule();


  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
           create: (BuildContext context)=>HomeCubit(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
        theme: getAppTheme(),

      ),

    );
  }
}


