import 'dart:async';
import 'package:app_store/features/common/state_renderer_impl.dart';
import 'package:app_store/features/home/presentation/view/widgets/cart_view_body/cart_view_body.dart';
import 'package:app_store/features/home/presentation/view/widgets/fav_view_body/fav_view_body.dart';
import 'package:app_store/features/home/presentation/view/widgets/logout_view_body/logout_view_body.dart';
import 'package:app_store/features/home/presentation/view/widgets/home_view_body/home_view_body.dart';
import 'package:app_store/features/home/presentation/view/widgets/setting_view_body/setting_view_body.dart';
import 'package:app_store/features/home/presentation/view_model/base_view_model/base_view_model.dart';
import 'package:app_store/features/home/presentation/view_model/home_cubit/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> implements BaseViewModel{

  HomeCubit(): super(HomeInitialState());

  static HomeCubit get(context)=>BlocProvider.of(context);

  int currentIndex =2;

  List screens= [
    const LogoutViewBody(),
    const FavViewBody(),
    const HomeViewBody(),
    const CartViewBody(),
    SettingViewBody(),
  ];
  void changeIndex(int index) {
    currentIndex = index;
    emit(HomeChangeBottomNavBarStates());
  }



  @override
  StreamController inputStreamController = StreamController<FlowStates>.broadcast();

  @override
  Stream<FlowStates> get outputState
  => inputStreamController.stream.map((flowState) => flowState);

  @override
  Sink get inputState => inputStreamController.sink;


  @override
  void dispose() {
    inputStreamController.close();
  }



}