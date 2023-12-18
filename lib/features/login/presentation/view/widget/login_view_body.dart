import 'package:app_store/core/utils/values_manager.dart';
import 'package:app_store/core/widgets/custom_background_image.dart';
import 'package:app_store/core/widgets/sign_in_up_info.dart';
import 'package:app_store/features/login/presentation/view/widget/login_details.dart';
import 'package:flutter/material.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            const BackgroundImageLogin(),
            SizedBox(
              height: MediaQuery.of(context).size.height *.6,
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(AppSize.s60),
                        topRight: Radius.circular(AppSize.s60))
                ),
              ),
            ),
          ],
        ),
        Align(
            alignment: Alignment.center,
            child: LoginDetails()),
      ],
    );


  }
}







