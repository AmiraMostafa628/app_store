import 'dart:async';
import 'package:app_store/features/common/state_renderer.dart';
import 'package:app_store/features/common/state_renderer_impl.dart';
import 'package:app_store/features/login/domain/request/requests.dart';
import 'package:app_store/features/login/domain/usecase/login_usecase.dart';
import 'package:app_store/features/login/presentation/view_model/login_cubit/login_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates>{
  LoginCubit(this._loginUseCase) : super(LoginInitialStates());


  static LoginCubit get(context) => BlocProvider.of(context);

  final LoginUseCase _loginUseCase;

  StreamController inputStreamController = StreamController<FlowStates>.broadcast();

  Stream<FlowStates> get outputState
  => inputStreamController.stream.map((flowState) => flowState);

  Future<void> fetchLoginData({required String email,required String password})async {
    inputStreamController.add(LoadingState(
        stateRendererType: StateRendererType.popupLoadingState));
    emit(LoginDataLoadingStates());

    var result = await _loginUseCase.execute(LoginRequest(
        email,password));
    result.fold((failure) {

      inputStreamController.add(ErrorState(StateRendererType.popupErrorState,
          failure.errMessage));
      emit(LoginDataErrorStates(failure.errMessage));
    }, (loginData){
      //_appPreferences.seToken(loginData.data!.token!);
      emit(LoginDataSuccessStates(loginData));

    });


  }


  IconData suffix =Icons.visibility_outlined;
  bool isPassword= true;
  changePasswordVisibility()
  {
    isPassword = !isPassword;
    suffix = isPassword?Icons.visibility_outlined:Icons.visibility_off_outlined;
    emit(LoginChangePasswordStates());

  }
}


