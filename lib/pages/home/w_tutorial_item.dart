
import 'package:flutter/material.dart';
import 'package:fluttour/utils/app_color.dart';
import 'package:fluttour/utils/app_enum.dart';
import 'package:fluttour/utils/app_extension.dart';
import 'package:fluttour/utils/app_style.dart';

class WTutorialItem extends StatelessWidget {
  WTutorialItem({this.tutorial});

  final Tutorial tutorial;

  @override
  Widget build(BuildContext context) {
    final IconData iconArrow = Icons.arrow_right;
    return Container(
      alignment: Alignment.centerLeft,
      height: 70.H,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
        Text(tutorial.getName(), style: boldTextStyle(20, color: AppColors.black)),
        Icon(Icons.arrow_right, color: Colors.black, size: 30.SP),
      ])
    );
  }
}
