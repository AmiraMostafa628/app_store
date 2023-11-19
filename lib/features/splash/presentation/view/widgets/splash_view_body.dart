import 'dart:async';
import 'package:app_store/core/utils/app_router.dart';
import 'package:app_store/core/utils/assets_manager.dart';
import 'package:app_store/core/utils/cache_helper.dart';
import 'package:app_store/core/utils/values_manager.dart';
import 'package:app_store/features/splash/presentation/view/widgets/sliding_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> with TickerProviderStateMixin {

  late AnimationController animationControllerImage ;
  late Animation<Offset> slidingAnimationImage ;
  final AppPreferences _appPreferences = AppPreferences();


  @override
  void initState() {
    initSlidingAnimationImage();
    navigateTo();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Center(
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          SizedBox(
            height: height *.9,
            child: Image.asset(
              AssetsManager.backGround,
              width: width,
              fit: BoxFit.fill,
              ),
          ),
          SizedBox(
              height: AppSize.s170,
              width: AppSize.s170,
              child: SlidingImage(slidingAnimation: slidingAnimationImage)),

        ],
      ),
    );
  }



  void initSlidingAnimationImage()
  {
    animationControllerImage =AnimationController(vsync: this,
        duration: const Duration(seconds: 1));

    slidingAnimationImage = Tween<Offset>(begin:
    const Offset(3,0),end:Offset.zero )
        .animate(animationControllerImage);

    animationControllerImage.forward();


  }
  
  
  void navigateTo(){
    _appPreferences.getUserLogin().then((value) {
      if(value == true){
        Future.delayed(const Duration(seconds: 4),(){
          GoRouter.of(context).push(AppRouter.kHome);
        });
      }
      else{
        Future.delayed(const Duration(seconds: 4),(){
          GoRouter.of(context).push(AppRouter.kLogin);
        });
      }
    });

  }


  @override
  void dispose() {
    animationControllerImage.dispose();
    super.dispose();
  }


}

