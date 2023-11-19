import 'package:app_store/core/utils/constants_manager.dart';
import 'package:app_store/core/utils/style_manager.dart';
import 'package:app_store/core/utils/values_manager.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,required this.text,
    this.isPassword=false,
    this.suffixIcon,
    required this.controller,
    required this.type,
    this.suffixPressed,
    required this.validate,
    this.onSubmit,
  }) : super(key: key);

  final String text;
  final bool isPassword;
  final IconData? suffixIcon;
  final TextEditingController controller;
  final TextInputType type;
  final Function? suffixPressed;
  final Function validate;
  final Function? onSubmit;

  @override
  Widget build(BuildContext context) {
    return  Material(
      elevation: 20.0,
      shadowColor: const Color(0xff000000).withOpacity(.4),
      borderRadius: BorderRadius.circular(AppSize.s12),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        style: Styles.testStyle14.copyWith(
          color: Colors.black
        ),
        decoration: InputDecoration(
          contentPadding:const EdgeInsets.all(AppPadding.p8),
          hintText: text,
          suffixIcon: suffixIcon!= null ? IconButton(
            onPressed: () {
              suffixPressed!();
            },
            icon:Icon(suffixIcon,
              color: kBottomNavIconColor,
              size: 17
            )) : null ,

        ),

        validator: (value) {
          return validate(value);
        },
        onFieldSubmitted:(s){
          onSubmit!(s);
        },

      ),
    );
  }

}
