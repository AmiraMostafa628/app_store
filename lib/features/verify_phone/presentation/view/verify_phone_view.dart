import 'package:app_store/features/verify_phone/presentation/view/widgets/verify_phone_view_body.dart';
import 'package:flutter/material.dart';

class VerifyPhoneView extends StatelessWidget {
  const VerifyPhoneView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: VerifyPhoneViewBody()),
    );
  }
}
