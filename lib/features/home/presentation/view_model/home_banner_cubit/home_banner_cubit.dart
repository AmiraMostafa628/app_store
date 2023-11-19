import 'dart:async';
import 'package:app_store/features/common/state_renderer.dart';
import 'package:app_store/features/common/state_renderer_impl.dart';
import 'package:app_store/features/home/domain/entities/banner_entity/home_banner_entity.dart';
import 'package:app_store/features/home/domain/use_cases/home_banner_use_case.dart';
import 'package:app_store/features/home/presentation/view_model/base_view_model/base_view_model.dart';
import 'package:app_store/features/home/presentation/view_model/home_banner_cubit/home_banner_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BannerCubit extends Cubit<HomeBannerStates> implements BaseViewModel{

  BannerCubit(this._bannerUseCase): super(HomeBannerInitialState());

  static BannerCubit get(context)=>BlocProvider.of(context);

 final HomeBannerUseCase _bannerUseCase;


 List<BannerEntity> banners=[];
  Future<void> fetchHomeBannerData()async {
    inputState.add(LoadingState(
        stateRendererType: StateRendererType.fullScreenLoadingState));
    emit((HomeBannerLoadingStates()));

     var result = await _bannerUseCase.execute();

    result.fold((failure) {
      inputState.add(ErrorState(StateRendererType.fullScreenErrorState,
          failure.errMessage));
      emit(HomeBannerErrorStates(failure.errMessage));
    }, (bannerEntity){
      banners=bannerEntity;
      inputState.add(ContentState());
      emit(HomeBannerSuccessStates(bannerEntity));


    });

  }

  @override
  void dispose() {
    inputStreamController.close();
  }

  @override
  StreamController inputStreamController = StreamController<FlowStates>.broadcast();

  @override
  Stream<FlowStates> get outputState
  => inputStreamController.stream.map((flowState) => flowState);

  @override
  Sink get inputState => inputStreamController.sink;



}