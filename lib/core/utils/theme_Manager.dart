import 'package:app_store/core/utils/constants_manager.dart';
import 'package:app_store/core/utils/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData getAppTheme()
{
  return ThemeData(
    fontFamily: 'inter',
    primaryColor: kPrimaryColor,
    appBarTheme:  const AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent,
        statusBarColor: kPrimaryColor,
      )
    ),
     elevatedButtonTheme:  ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor,),

        )
  ),
    inputDecorationTheme:   InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      hintStyle:
      const TextStyle(fontSize:AppSize.s12,color: Color(0xffB1B1B1)),
      errorStyle: const TextStyle(color: Colors.red),
      enabledBorder:  OutlineInputBorder(
        borderSide: BorderSide(
          color:  const Color(0xffB1B1B1).withOpacity(.2)
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: kPrimaryColor,
        ),

      ),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red,
        ),

      ),
      border:const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xffFFFFFF)

          )
      )
),


  );
}
