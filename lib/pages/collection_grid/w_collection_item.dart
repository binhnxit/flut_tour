
import 'package:flutter/material.dart';
import 'package:fluttour/domain/models/collection_model.dart';
import 'package:fluttour/utils/app_color.dart';
import 'package:fluttour/utils/app_mixin.dart';
import 'package:fluttour/utils/app_style.dart';

class WCollectionItem extends StatelessWidget {
  WCollectionItem({this.item, this.delegate});

  final CollectionModel item;
  final GridViewDelegate delegate;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        delegate.gridView(this, item);
      },
      child: Container(
        decoration: BoxDecoration(
          color: item.isSelected ? AppColors.salmon : Colors.white,
          border: Border.all(color: AppColors.gray)
        ),
        child: Center(
          child: Text(item.title, style: boldTextStyle(20, color: AppColors.black),),
        )
      ),
    );
  }
}
