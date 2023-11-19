import 'package:app_store/core/utils/constants_manager.dart';
import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({
  super.key, required this.child,
  });

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration:  BoxDecoration(
        color: kPrimaryColor,
        gradient:  LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xff0062BD).withOpacity(.65),
              Colors.white,
            ],
            stops: const [
              0.1,
              0.5,
            ]
        ),
      ),
      child: child,
    );
  }
}