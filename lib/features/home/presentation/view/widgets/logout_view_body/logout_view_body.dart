import 'package:app_store/core/utils/cache_helper.dart';
import 'package:app_store/core/utils/style_manager.dart';
import 'package:app_store/core/utils/values_manager.dart';
import 'package:app_store/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class LogoutViewBody extends StatelessWidget {
  const LogoutViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppPreferences appPreferences = AppPreferences();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Are You Sure You Wanna Log Out',
            style: Styles.testStyle16.copyWith(
                color:  const Color(0xff464646),
                fontStyle: FontStyle.italic
            ),
          ),
          SizedBox(
            height: AppSize.s20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomButton(
                  textColor: Colors.white,
                  text: 'Yes',
                  onPressed: (){
                   appPreferences.logout(context);
                  }),
              CustomButton(
                  textColor: Colors.white,
                  text: 'No',
                  onPressed: (){
                  }),
            ],
          )
        ]
        ,
      ),
    );
  }
}

