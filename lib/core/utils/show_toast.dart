import 'package:app_store/core/utils/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

void showToast(
    {
      required text,
      required ToastState state,

    }
    )=>Toast.show(
  text,
  duration: 5,
  gravity: Toast.bottom,
  textStyle:Styles.testStyle16,
  backgroundColor: chooseToastColor(state),

);

enum ToastState {success,error,warning}

Color chooseToastColor(ToastState state)
{
  Color? color;

  switch(state)
  {
    case ToastState.success:
      color = Colors.green;
      break;
    case ToastState.error:
      color = Colors.red;
      break;
    case ToastState.warning:
      color = Colors.amber;
      break;
  }
  return color;
}
