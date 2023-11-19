import 'package:app_store/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';

class BackgroundImageLogin extends StatelessWidget {
  const BackgroundImageLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children:[
      Container(
        decoration: const BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              AssetsManager.login,
            ),
          ),
        ),
        height: 300.0,
      ),
      Container(
        height: 360.0,
        decoration: BoxDecoration(
            color: Colors.white,
            gradient: LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                colors: [
                  const Color(0xff0062BD).withOpacity(.4),
                  Colors.black,
                ],
                stops: const [
                  0.0,
                  1.0
                ])),
      )
    ]);
  }
}


