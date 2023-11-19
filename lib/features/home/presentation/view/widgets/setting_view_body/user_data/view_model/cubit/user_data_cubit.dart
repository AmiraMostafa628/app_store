import 'package:app_store/features/home/domain/use_cases/user_data_use_case.dart';
import 'package:app_store/features/home/presentation/view/widgets/setting_view_body/user_data/view_model/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserDataCubit extends Cubit<UserDataStates>{
  UserDataCubit(this._userDataUseCase):super(UserDataInitialStates());

  final UserDataUseCase _userDataUseCase;

  static UserDataCubit get(context)=>BlocProvider.of(context);



  Future<void> fetchUserData()async {
    emit((UserDataLoadingStates()));

    var result = await _userDataUseCase.execute();

    result.fold((failure) {
      emit(UserDataErrorStates(failure.errMessage));
    }, (userDataEntity) {
      emit(UserDataSuccessStates(userDataEntity));
    });
  }
}