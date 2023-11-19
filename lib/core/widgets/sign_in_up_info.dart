import 'package:app_store/core/utils/assets_manager.dart';
import 'package:app_store/core/utils/values_manager.dart';
import 'package:app_store/core/widgets/logo_widget.dart';
import 'package:flutter/material.dart';

class SignInUpInfo extends StatelessWidget {
  const SignInUpInfo({Key? key, required this.signInUpDetails, required this.aspectRatio, required this.height}) : super(key: key);

  final Widget signInUpDetails;
  final double aspectRatio;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        AspectRatio(
          aspectRatio: aspectRatio,
          child: Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.p20),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * height,
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
                child: signInUpDetails,
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
  }
}