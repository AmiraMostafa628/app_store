import 'package:app_store/core/utils/constants_manager.dart';
import 'package:app_store/core/widgets/custom_fading_animations.dart';
import 'package:app_store/core/utils/style_manager.dart';
import 'package:app_store/core/utils/values_manager.dart';
import 'package:app_store/features/home/presentation/view/widgets/setting_view_body/user_data/view_model/cubit/states.dart';
import 'package:app_store/features/home/presentation/view/widgets/setting_view_body/user_data/view_model/cubit/user_data_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserDataWidget extends StatelessWidget {
  const UserDataWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDataCubit,UserDataStates>(
      builder: (context,state) {
       if (state is UserDataSuccessStates)
         {
           return Row(
             children: [
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text(state.userDataEntity.data!.name!,
                     style: Styles.testStyle14.copyWith(
                         color:  const Color(0xff464646),
                         fontWeight: FontWeight.bold

                     ),
                   ),
                   const SizedBox(height: AppSize.s5,),
                   Text(state.userDataEntity.data!.email!,
                     overflow: TextOverflow.ellipsis,
                     maxLines: 1,
                     style: Styles.testStyle14.copyWith(
                       color:  const Color(0xff464646),


                     ),
                   ),


                 ],
               ),
               Align(
                 alignment: AlignmentDirectional.center,
                 child: IconButton(onPressed: (){}, icon: const Icon(
                   Icons.edit,
                   color: kPrimaryColor,
                 ),
                 ),
               ),
             ],
           );
         }
       else
         {
           return const UserDataLoading();
         }
      }
    );
  }
}


class UserDataLoading extends StatelessWidget {
  const UserDataLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomFadingWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextLoading(width: .5,),
          SizedBox(
            height: AppSize.s10,
          ),
          TextLoading(width: .5,),

        ],
      ),
    );
  }
}

class TextLoading extends StatelessWidget {
  const TextLoading({Key? key,required this.width}) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: MediaQuery.of(context).size.width * width,
      height: 20,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius:
            const BorderRadius.all(Radius.circular(AppPadding.p16))),
      ),
    );

  }
}

