import 'package:app_store/core/utils/values_manager.dart';
import 'package:app_store/core/widgets/custom_background_image.dart';
import 'package:app_store/core/widgets/sign_in_up_info.dart';
import 'package:app_store/features/register/presentation/view/widget/register_details.dart';
import 'package:flutter/material.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({Key? key}) : super(key: key);

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
              aspectRatio: 4/2.3,
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
           signInUpDetails: RegisterDetails(),
           aspectRatio: 2/3.2,
           height: .58,
         ),

      ],
    );

  }
}







