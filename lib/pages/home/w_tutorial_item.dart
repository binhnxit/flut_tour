
import 'package:flutter/material.dart';
import 'package:fluttour/utils/app_color.dart';
import 'package:fluttour/utils/app_enum.dart';
import 'package:fluttour/utils/app_extension.dart';
import 'package:fluttour/utils/app_mixin.dart';
import 'package:fluttour/utils/app_style.dart';

class WTutorialItem extends StatelessWidget {
  WTutorialItem({this.tutorial, this.onPressItem});

  final Tutorial tutorial;
  final Function onPressItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.H, bottom: 30.H),
      alignment: Alignment.centerLeft,
      child: InkWell(
        onTap: () {
          onPressItem();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
          Flexible(child: Text(tutorial.getName(), style: boldTextStyle(20, color: AppColors.black))),
          Icon(Icons.arrow_right, color: Colors.black, size: 30.SP),
        ]),
      )
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
