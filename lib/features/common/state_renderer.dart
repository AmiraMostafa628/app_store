import 'package:app_store/core/utils/assets_manager.dart';
import 'package:app_store/core/utils/constants_manager.dart';
import 'package:app_store/core/utils/style_manager.dart';
import 'package:app_store/core/utils/values_manager.dart';
import 'package:app_store/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

enum StateRendererType{
  //popup states (dialog)
  popupLoadingState,
  popupSuccessState,
  popupErrorState,

  //full screen state
  fullScreenLoadingState,
  fullScreenErrorState,
  fullScreenEmptyState,

  //general
  contentState

}
class StateRenderer extends StatelessWidget {
  final StateRendererType stateRendererType;
  final  String message;
  final String title;
  final Function retryActionFunction;

  const StateRenderer({super.key,
    required this.stateRendererType,
    this.message = "Loading",
    this.title='',
    required this.retryActionFunction,
  });

  @override
  Widget build(BuildContext context) {
    return _getStateWidget(context);
  }

  Widget _getStateWidget(BuildContext context){

     switch(stateRendererType)
     {

       case StateRendererType.popupLoadingState:
         return getPopUoDialog(context,[ const Padding(
           padding: EdgeInsets.all(20.0),
           child: CircularProgressIndicator(color:kPrimaryColor,),
         ),]);

       case StateRendererType.popupSuccessState:
         return getPopUoDialog(context,[
           _getAnimatedImage(AssetsManager.success),
           _getMessage(title),
           _getMessage(message),
           _getButtonAction('ok', context)
         ]);

       case StateRendererType.popupErrorState:
         return getPopUoDialog(context, [
           _getAnimatedImage(AssetsManager.error),
           _getMessage(message),
           _getButtonAction('ok',context),
         ]);

       case StateRendererType.fullScreenLoadingState:
         return getItemsColumn([
            const CircularProgressIndicator(color:kPrimaryColor,),
           _getMessage('Loading...'),
         ]);

       case StateRendererType.fullScreenErrorState:
         return getItemsColumn([
           _getAnimatedImage(AssetsManager.error),
           _getMessage(message),
           _getButtonAction('Retry again',context),
         ]);

       case StateRendererType.fullScreenEmptyState:
         return getItemsColumn([
           _getAnimatedImage(AssetsManager.empty),
           _getMessage(message),
         ]);

       case StateRendererType.contentState:
         return Container();

       default:
         return Container();

     }
  }




  Widget getPopUoDialog(BuildContext context,List<Widget>children){
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s14),
      ),
      elevation: AppSize.s1_5,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppSize.s14),
          boxShadow:const [
             BoxShadow(
              color: Colors.black26,
          )
          ]
        ),
        child:getDialogContext(context,children),
      ),

    );
  }
  Widget getDialogContext(BuildContext context,List<Widget>children){
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Widget getItemsColumn(List<Widget>children){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Widget _getAnimatedImage(String animationName)
  {
    return SizedBox(
        height: AppSize.s100,
        width: AppSize.s100,

        child: ClipRRect(
            borderRadius: BorderRadius.circular(AppSize.s16),
            child: Lottie.asset(animationName)),
    );
  }

  Widget _getMessage(String message)
  {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p12),
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: Styles.testStyle14.copyWith(
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _getButtonAction(String buttonTitle,BuildContext context)
  {
    return Padding(
      padding: const EdgeInsets.only(right: AppPadding.p18,
          left: AppPadding.p18,
          bottom: AppPadding.p18
      ),
      child: CustomButton(
          onPressed: (){
            if(stateRendererType == StateRendererType.fullScreenErrorState)
              {
                // call retry function
                retryActionFunction.call();
              }
            else //popup error state
              {
                Navigator.of(context).pop();
              }
          },
        text: buttonTitle,
        textColor: Colors.white,
        width: double.infinity,
      ),
    );
  }


}
