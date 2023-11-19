import 'package:app_store/core/utils/style_manager.dart';
import 'package:app_store/core/utils/values_manager.dart';
import 'package:app_store/features/home/presentation/view/widgets/setting_view_body/user_data/user_data_view.dart';
import 'package:flutter/material.dart';
import 'card_widget.dart';

class SettingViewBody extends StatelessWidget {
     SettingViewBody({Key? key}) : super(key: key);


  final List<String> cardTitle =const[
    'Account',
    'Data',
    'Fees',
    'Content',
    'Service'];

  final List cardSubTitle =[
    const UserDataWidget(),
    Container(),
    Container(),
    Container(),
    Container(),];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p40,horizontal: AppPadding.p20),
      child: Column (
        children: [
          Text('Help',
            style: Styles.testStyle22.copyWith(
              color: const Color(0xffFFFFFF),
            ),
          ),
          const SizedBox(height: AppSize.s30,),
          if(cardTitle.isNotEmpty)
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context,index)=>CardWidget(
                    title:cardTitle[index],subTitle: cardSubTitle[index],),
                  separatorBuilder:(context,index)=> const SizedBox(height:AppSize.s12 ,),
                  itemCount: cardTitle.length),
            ),




        ],
      ),
    );
  }








}



