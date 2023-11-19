import 'dart:async';
import 'package:app_store/features/common/state_renderer.dart';
import 'package:app_store/features/common/state_renderer_impl.dart';
import 'package:app_store/features/register/domain/request/requests.dart';
import 'package:app_store/features/register/domain/usecase/register_use_case.dart';
import 'package:app_store/features/register/presentation/view_model/register_cubit/register_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class RegisterCubit extends Cubit<RegisterStates>{
  RegisterCubit(this._registerUseCase) : super(RegisterCubitInitialStates());

  static RegisterCubit get(context) => BlocProvider.of(context);


  final RegisterUseCase _registerUseCase;

  StreamController inputStreamController = StreamController<FlowStates>.broadcast();

  Stream<FlowStates> get outputState
  => inputStreamController.stream.map((flowState) => flowState);

  Future<void> fetchRegisterData(
      {required String userName,
        required String phone,
        required String email,
        required String password,})async {

    inputStreamController.add(LoadingState(
        stateRendererType: StateRendererType.popupLoadingState));
    emit(RegisterDataLoadingStates());

    var result = await _registerUseCase.execute(RegisterRequest(
        userName,phone,
        email,password));

    result.fold((failure) {
      inputStreamController.add(ErrorState(StateRendererType.popupErrorState,
          failure.errMessage));
      emit(RegisterDataErrorStates(failure.errMessage));
    }, (registerData){
      print(registerData.message);
      print(registerData.data);
      emit(RegisterDataSuccessStates(registerData));
    });


  }





  IconData suffix =Icons.visibility_outlined;
  bool isPassword= true;
  changePasswordVisibility()
  {
    isPassword = !isPassword;
    suffix = isPassword?Icons.visibility_outlined:Icons.visibility_off_outlined;
    emit(RegisterCubitChangePasswordStates());

  }
}