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
    return Padding(
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
        child: signInUpDetails,
      ),
    );
  }
}