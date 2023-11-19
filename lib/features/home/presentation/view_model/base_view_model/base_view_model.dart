
import 'dart:async';
import 'package:app_store/features/common/state_renderer_impl.dart';

 abstract class BaseViewModel with BaseViewModelInputs implements BaseViewModelOutputs{
  //shared variables and function that will be used through any view model
  StreamController inputStreamController = StreamController<FlowStates>.broadcast();

  @override
  void dispose() {
    inputStreamController.close();
  }

  @override
  Sink get inputState => inputStreamController.sink;

  @override
  Stream<FlowStates> get outputState
  => inputStreamController.stream.map((flowState) => flowState);

}

mixin BaseViewModelInputs{

  void dispose(); //will be called when view model dies
  Sink get inputState;

}

mixin BaseViewModelOutputs{
  Stream<FlowStates> get outputState;
}