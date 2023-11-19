
import 'package:app_store/core/utils/constants_manager.dart';
import 'package:app_store/core/utils/values_manager.dart';
import 'package:app_store/core/widgets/build_box_decoration.dart';
import 'package:app_store/core/widgets/gradient_container.dart';
import 'package:app_store/features/home/presentation/view_model/home_cubit/home_cubit.dart';
import 'package:app_store/features/home/presentation/view_model/home_cubit/home_states.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';




class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
     return BlocBuilder<HomeCubit,HomeStates>(
         builder: ((context, state) {
           var cubit = HomeCubit.get(context);
           return Scaffold(
             body: GradientContainer(child: SafeArea(child: cubit.screens[cubit.currentIndex],)),
             bottomNavigationBar: CurvedNavigationBar(
                 height: 55,
                 buttonBackgroundColor: Colors.transparent,
                 animationCurve: Curves.linear,
                 color: Colors.white,
                 backgroundColor: Colors.white,
                 animationDuration: const Duration(milliseconds: 400),
                 onTap: (index){
                   cubit.changeIndex(index);
                 },
                 index: cubit.currentIndex,
                 items:[
                   _buildNavItem( FontAwesomeIcons.arrowRightFromBracket,cubit.currentIndex, 0),
                   _buildNavItem( FontAwesomeIcons.solidHeart,cubit.currentIndex,1),
                   _buildNavItem( FontAwesomeIcons.house, cubit.currentIndex,2),
                   _buildNavItem( FontAwesomeIcons.cartShopping, cubit.currentIndex,3),
                   _buildNavItem( FontAwesomeIcons.gear, cubit.currentIndex,4),
                 ]
             ),
           );
         }));
  }

Widget _buildNavItem(IconData iconData, int currentIndex , int index){
    return IconTheme(
        data: IconThemeData(
          color: currentIndex == index? kBottomNavColor : kBottomNavIconColor
        ),
        child: currentIndex == index?
            Container(
              width: AppSize.s40,
              height: AppSize.s40,
              decoration: BoxDecoration(
                gradient:buildBoxGradient(),
                shape: BoxShape.circle,
              ),
              child: Icon(
                iconData,
                size: AppSize.s20,
              ),
            ):
            Icon(
              iconData,
              size: AppSize.s20,
            )
    );

}
}



