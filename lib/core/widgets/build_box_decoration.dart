import 'package:flutter/material.dart';

LinearGradient buildBoxGradient() {
  return  LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        const Color(0xff0062BD),
        const Color(0xff0062BD).withOpacity(.8),
        const Color(0xff0062BD).withOpacity(.4),
      ],
    );

}