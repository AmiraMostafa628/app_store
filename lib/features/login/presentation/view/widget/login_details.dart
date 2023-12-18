import 'package:app_store/core/utils/app_router.dart';
import 'package:app_store/core/utils/assets_manager.dart';
import 'package:app_store/core/utils/cache_helper.dart';
import 'package:app_store/core/utils/di.dart';
import 'package:app_store/core/utils/style_manager.dart';
import 'package:app_store/core/utils/values_manager.dart';
import 'package:app_store/core/widgets/custom_button.dart';
import 'package:app_store/core/widgets/custom_text_form_field.dart';
import 'package:app_store/core/widgets/logo_widget.dart';
import 'package:app_store/features/login/presentation/view_model/login_cubit/login_cubit.dart';
import 'package:app_store/features/login/presentation/view_model/login_cubit/login_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginDetails extends StatelessWidget {
      LoginDetails({Key? key}) : super(key: key);

  final formKey= GlobalKey<FormState>();

  final emailController =  TextEditingController();

  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<LoginCubit,LoginStates>(
      listener: (context,state){
        if(state is LoginDataSuccessStates)
          {
            AppPreferences.getToken().then((value)  async {
              await initMainModule();

            });

            GoRouter.of(context).push(AppRouter.kHome);

      }
      },
        builder: (context,state){
          var cubit = LoginCubit.get(context);
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(AppPadding.p20),
                child: Container(
                  decoration:  BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xff000000).withOpacity(.25),
                        blurRadius: 20, // Shadow position
                      ),
                    ],
                    borderRadius: BorderRadius.circular(AppSize.s30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: AppPadding.p20),
                    child: Form(
                      key: formKey,
                      child: IntrinsicHeight(
                        child: Column(
                          children: [
                            const Text(
                              'Welcome',
                              style: Styles.testStyle22,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: AppPadding.p10),
                              child: Container(
                                height: 2,
                                width: MediaQuery.of(context).size.width *.3,
                                color: const Color(0xff0062BD),
                              ),
                            ),
                            const SizedBox(height: AppSize.s6,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20 ),
                              child: SizedBox(
                                  height: AppSize.s40,
                                  child: CustomTextFormField(
                                    controller: emailController,
                                    type: TextInputType.emailAddress,
                                    text: 'Email Address',
                                    validate: (String value){
                                      if(value.isEmpty)
                                      {
                                        return 'Email Can\'t be Empty';
                                      }
                                    },

                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: AppPadding.p10,
                                  horizontal: AppPadding.p20 ),
                              child: SizedBox(
                                  height: AppSize.s40,
                                  child: CustomTextFormField(
                                    controller: passwordController,
                                    type: TextInputType.visiblePassword,
                                    isPassword: cubit.isPassword,
                                    text: 'Password',
                                    suffixIcon: cubit.suffix,
                                    suffixPressed: (){
                                      cubit.changePasswordVisibility();
                                    },
                                    validate: (String value){
                                      if(value.isEmpty)
                                      {
                                        return 'password Can\'t be Empty';
                                      }
                                    },
                                  )),
                            ),
                            const SizedBox(
                              height: AppSize.s10,
                            ),
                            CustomButton(
                              textColor: Colors.white,
                              text: 'Login',
                              width: MediaQuery.of(context).size.width * .65,
                              onPressed: (){
                                if(formKey.currentState!.validate()) {
                                  cubit.fetchLoginData(
                                      email: emailController.text,
                                      password: passwordController.text
                                  );
                                }
                              },
                            ),

                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: AppPadding.p14),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text('Don\'t have an account ?',
                                    style: Styles.testStyle10,
                                  ),
                                  TextButton(
                                    onPressed: (){
                                      GoRouter.of(context).push(AppRouter.kRegister);
                                    },
                                    child: const Text(
                                      'Sign Up',
                                      style: Styles.testStyle14,
                                    ),

                                  )
                                ],
                              ),
                            ),



                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: AppSize.s20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p25),
                child: Image.asset(AssetsManager.or),
              ),
              const SizedBox(height: AppSize.s20,),
              const LogoWidget(),
            ],
          );
        });
  }
}



