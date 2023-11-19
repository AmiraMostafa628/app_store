
import 'package:app_store/core/utils/style_manager.dart';
import 'package:app_store/core/utils/values_manager.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key,
    required this.textColor,
    this.borderRadius,
    required this.text,
    this.fontSize, required this.onPressed, this.width,}) : super(key: key);

  final Color textColor;
  final BorderRadius? borderRadius;
  final String text;
  final double? fontSize;
  final double? width;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height:35,
      width: width,
      decoration:  _boxDecoration(),
      child: TextButton(
          onPressed:onPressed ,
          style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius:borderRadius?? BorderRadius.circular(AppSize.s30),
              )
          ),
          child: Center(
            child: Text(text,
              style: Styles.testStyle16,
            ),
          )),
    );
  }
}
BoxDecoration _boxDecoration() {
  return BoxDecoration(
    gradient:  LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        const Color(0xff0062BD),
        const Color(0xff0062BD).withOpacity(.8),
        const Color(0xff0062BD).withOpacity(.4),
      ],
    ),
    borderRadius: BorderRadius.circular(AppSize.s30),
  );
}