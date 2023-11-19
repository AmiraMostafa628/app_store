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
      alignment: AlignmentDirectional.topCenter,
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            const BackgroundImageLogin(),
            AspectRatio(
              aspectRatio: 4/2.1,
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
        SignInUpInfo(
          signInUpDetails: LoginDetails(),
          aspectRatio: 2/2.8,
          height: .42,
        ),

      ],
    );

  }
}







