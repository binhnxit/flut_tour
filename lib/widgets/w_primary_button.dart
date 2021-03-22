
import 'package:flutter/material.dart';
import 'package:fluttour/utils/app_color.dart';
import 'package:fluttour/utils/app_extension.dart';
import 'package:fluttour/utils/app_style.dart';

class WPrimaryButton extends StatelessWidget {
  WPrimaryButton({this.title, this.isSelected, this.onPress});

  final String title;
  final Function onPress;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPress();
      },
      child: Container(
        height: 70.H,
        decoration: BoxDecoration(
          color: backgroundColors(),
          border: Border.all(color: borderColors()),
          borderRadius: BorderRadius.circular(8.SP)
        ),
        child: Center(
          child: Text(title, style: boldTextStyle(16, color: titleColors()))
        )
      ),
    );
  }

  Color borderColors() {
    return isSelected ? Colors.transparent : AppColors.black;
  }

  Color backgroundColors() {
    return isSelected ? AppColors.salmon : Colors.white;
  }

  Color titleColors() {
    return isSelected ? Colors.white : AppColors.black;
  }
}
