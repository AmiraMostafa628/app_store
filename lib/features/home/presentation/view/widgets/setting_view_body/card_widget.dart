import 'package:app_store/core/utils/style_manager.dart';
import 'package:app_store/core/utils/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardWidget extends StatefulWidget {
   const CardWidget({ key, required this.title,required this.subTitle}) : super(key: key);

  final String title;
  final Widget subTitle;

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  bool _showData = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
          setState(() => _showData = !_showData);
        },
        child: Container(
            width: MediaQuery.of(context).size.width,
            decoration:  BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xff000000).withOpacity(.25),
                  blurRadius: 20,
                ),
              ],
            ),
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(widget.title,
                            style: Styles.testStyle14,
                          ),
                          InkWell(
                              onTap: (){
                                setState(() => _showData = !_showData);
                              },
                              child:_showData ?const Icon(FontAwesomeIcons.chevronUp,
                                size: AppSize.s14,
                              ):const Icon(FontAwesomeIcons.chevronDown,
                                size: AppSize.s14,
                              )
                          )
                        ]
                    )
                ),
                _showData ? Padding(
                  padding: const EdgeInsets.only(left: AppPadding.p8,right: AppPadding.p8,bottom: AppPadding.p8),
                  child: widget.subTitle,
                ): const SizedBox()
              ],
            )
        )
    );
  }
}