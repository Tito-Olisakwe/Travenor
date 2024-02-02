import '../models/listdetails_item_model.dart';
import 'package:flutter/material.dart';
import 'package:travenor/core/app_export.dart';

// ignore: must_be_immutable
class ListdetailsItemWidget extends StatelessWidget {
  ListdetailsItemWidget(
    this.listdetailsItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  ListdetailsItemModel listdetailsItemModelObj;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 42.h,
      child: CustomImageView(
        imagePath: listdetailsItemModelObj?.rectangle,
        height: 42.adaptSize,
        width: 42.adaptSize,
        radius: BorderRadius.circular(
          12.h,
        ),
      ),
    );
  }
}
