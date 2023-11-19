import 'package:flutter/material.dart';

class GetTitleSection extends StatelessWidget {
  const GetTitleSection({Key? key, required this.title, required this.textStyle}) : super(key: key);

  final String title;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Text(title ,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: textStyle,);
  }
}