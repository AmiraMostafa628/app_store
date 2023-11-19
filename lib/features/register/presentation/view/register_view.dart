import 'package:app_store/features/common/state_renderer_impl.dart';
import 'package:app_store/features/register/presentation/view/widget/register_view_body.dart';
import 'package:app_store/features/register/presentation/view_model/register_cubit/register_cubit.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<FlowStates>(
        stream: RegisterCubit.get(context).outputState,
        builder: (context,snapshot){
          return snapshot.data?.getScreenWidget(
              context,const RegisterViewBody(),(){})?? const RegisterViewBody();
        },
      ),
    );
  }
}
