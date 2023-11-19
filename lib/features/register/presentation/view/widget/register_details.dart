import 'package:app_store/core/utils/app_router.dart';
import 'package:app_store/core/utils/style_manager.dart';
import 'package:app_store/core/utils/values_manager.dart';
import 'package:app_store/core/widgets/custom_button.dart';
import 'package:app_store/core/widgets/custom_text_form_field.dart';
import 'package:app_store/features/register/presentation/view_model/register_cubit/register_cubit.dart';
import 'package:app_store/features/register/presentation/view_model/register_cubit/register_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegisterDetails extends StatelessWidget {
      RegisterDetails({Key? key}) : super(key: key);

  final formKey= GlobalKey<FormState>();
  final userNameController =  TextEditingController();
  final phoneController = TextEditingController();
  final emailController =  TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<RegisterCubit,RegisterStates>(
      listener: (context, state) {
        if(state is RegisterDataSuccessStates)
        {

          GoRouter.of(context).push(AppRouter.kHome);
        }
      },
        builder: (context,state){
          var cubit = RegisterCubit.get(context);
          return Padding(
            padding: const EdgeInsets.only(top: AppPadding.p20),
            child: Form(
              key: formKey,
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
                          controller: userNameController,
                          type: TextInputType.name,
                          text: 'UserName',
                          validate: (String value){
                            if(value.isEmpty)
                            {
                              return 'UserName Can not be Empty';
                            }
                          },


                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: AppPadding.p10,horizontal: AppPadding.p20 ),
                    child: SizedBox(
                        height: AppSize.s40,
                        child: CustomTextFormField(
                          controller: phoneController,
                          type: TextInputType.phone,
                          text: 'Phone',
                          validate: (String value){
                            if(value.isEmpty)
                            {
                              return 'password Can\'t be Empty';
                            }
                          },
                        )),
                  ),
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
                    padding: const EdgeInsets.symmetric(vertical: AppPadding.p10,horizontal: AppPadding.p20 ),
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
                    text: 'Sign Up',
                    width: MediaQuery.of(context).size.width * .65,
                    onPressed: (){
                      if(formKey.currentState!.validate()) {
                        cubit.fetchRegisterData(
                          userName: userNameController.text,
                          phone: phoneController.text,
                          email: emailController.text,
                          password:  passwordController.text,
                        );
                      }

                    },
                  ),
                   Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p14),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Already have an account ?',
                            style: Styles.testStyle10,
                          ),
                          TextButton(
                            onPressed: (){
                              GoRouter.of(context).pop();
                            },
                            child: const Text(
                              'Login',
                              style: Styles.testStyle14,
                            ),

                          )
                        ],
                      ),
                    ),
                  ),


                ],
              ),
            ),
          );
        });
  }
}

