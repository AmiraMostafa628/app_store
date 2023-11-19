import 'package:app_store/features/common/state_renderer_impl.dart';
import 'package:app_store/features/login/presentation/view/widget/login_view_body.dart';
import 'package:app_store/features/login/presentation/view_model/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<FlowStates>(
        stream: LoginCubit.get(context).outputState,
        builder: (context,snapshot){
          return snapshot.data?.getScreenWidget(
              context,const LoginViewBody(),(){})??
              const LoginViewBody();
        },
      ),
    );
  }
}
