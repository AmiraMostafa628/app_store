import 'package:app_store/core/utils/style_manager.dart';
import 'package:app_store/core/utils/values_manager.dart';
import 'package:app_store/core/widgets/gradient_container.dart';
import 'package:app_store/features/verify_phone/presentation/view/widgets/pin_code_verification.dart';
import 'package:flutter/material.dart';

class VerifyPhoneViewBody extends StatelessWidget {
  const VerifyPhoneViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GradientContainer(child: Padding(
      padding: const EdgeInsets.only(top: AppPadding.p40),
      child: Column(
        children: [
          Text('Verify Email',
            style: Styles.testStyle22.copyWith(
              color: const Color(0xffFFFFFF),
            ),
          ),
          const PinCodeVerification(),


        ],
      ),
    ),);
  }
}




