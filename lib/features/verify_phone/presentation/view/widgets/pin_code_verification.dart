

import 'dart:async';

import 'package:app_store/core/utils/constants_manager.dart';
import 'package:app_store/core/utils/style_manager.dart';
import 'package:app_store/core/utils/values_manager.dart';
import 'package:app_store/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeVerification extends StatefulWidget {
  const PinCodeVerification({Key? key}) : super(key: key);

  @override
  State<PinCodeVerification> createState() => _PinCodeVerificationState();
}

class _PinCodeVerificationState extends State<PinCodeVerification> {
  TextEditingController textEditingController = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }

  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: const Duration(seconds: 2),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(
        top: MediaQuery.of(context).size.height *.19,
        right: MediaQuery.of(context).size.width *.15,
        left: MediaQuery.of(context).size.width *.15,
      ),
      child: Column(
        children: [
          Form(
            key: formKey,
            child: PinCodeTextField(
              appContext: context,
              length: 4,
              obscureText: true,
              obscuringCharacter: '*',
              blinkWhenObscuring: true,
              backgroundColor: Colors.transparent,
              animationType: AnimationType.fade,
              validator: (v) {
                if (v!.length < 3) {
                  return "I'm from validator";
                } else {
                  return null;
                }
              },
              pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(10),
                  fieldHeight: 50,
                  fieldWidth: 45,
                  activeColor: kLightPrimaryColor,
                  selectedColor: kLightPrimaryColor,
                  inactiveColor: Colors.white,
                  disabledColor: kLightPrimaryColor,
                  activeFillColor: Colors.white,
                  inactiveFillColor: Colors.white,
                  selectedFillColor: Colors.white

              ),

              animationDuration: const Duration(milliseconds: 300),
              enableActiveFill: true,
              errorAnimationController: errorController,
              controller: textEditingController,
              keyboardType: TextInputType.number,
              onCompleted: (v) {
                debugPrint("Completed");
              },
              onChanged: (value) {
                debugPrint(value);
                setState(() {
                  currentText = value;
                });
              },
              beforeTextPaste: (text) {
                debugPrint("Allowing to paste $text");
                return true;
              },
            ),
          ),
          const SizedBox(height: AppSize.s20,),
          TextButton(
            onPressed: () => snackBar("OTP resend!!"),
            child: const Text(
              "Resend Code",
              style:Styles.testStyle14,
            ),
          ),
          const SizedBox(height: AppSize.s40,),
          CustomButton(
            textColor: Colors.white,
            text: 'Verify',
            width: MediaQuery.of(context).size.width,
            onPressed: (){
              formKey.currentState!.validate();
              // conditions for validating
              if (currentText.length != 6 || currentText != "123456") {
                errorController!.add(ErrorAnimationType
                    .shake); // Triggering error shake animation
                setState(() => hasError = true);
              } else {
                setState(
                      () {
                    hasError = false;
                    snackBar("OTP Verified!!");
                  },
                );
              }
            },
          )
        ],
      ),
    );
  }
}