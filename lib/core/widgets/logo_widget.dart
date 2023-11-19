import 'package:app_store/core/utils/assets_manager.dart';
import 'package:app_store/core/utils/values_manager.dart';
import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(AssetsManager.facebookLogo,width: AppSize.s65,height: AppSize.s70,),
        Image.asset(AssetsManager.appleLogo,width: AppSize.s65,height: AppSize.s70),
        Image.asset(AssetsManager.googleLogo,width: AppSize.s65,height: AppSize.s70),
      ],
    );
  }
}
