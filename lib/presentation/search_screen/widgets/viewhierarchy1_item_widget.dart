import '../models/viewhierarchy1_item_model.dart';
import 'package:flutter/material.dart' hide SearchController;
import 'package:travenor/core/app_export.dart';

// ignore: must_be_immutable
class Viewhierarchy1ItemWidget extends StatelessWidget {
  Viewhierarchy1ItemWidget(
    this.viewhierarchy1ItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  Viewhierarchy1ItemModel viewhierarchy1ItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.h),
      decoration: AppDecoration.outlineOnPrimaryContainer.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder18,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: viewhierarchy1ItemModelObj?.reservoirImage,
            height: 124.v,
            width: 137.h,
            radius: BorderRadius.circular(
              16.h,
            ),
          ),
          SizedBox(height: 7.v),
          Padding(
            padding: EdgeInsets.only(left: 4.h),
            child: Text(
              viewhierarchy1ItemModelObj.reservoirText!,
              style: theme.textTheme.titleSmall,
            ),
          ),
          SizedBox(height: 6.v),
          Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgLocation,
                  height: 14.adaptSize,
                  width: 14.adaptSize,
                  margin: EdgeInsets.only(bottom: 1.v),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 3.h),
                  child: Text(
                    viewhierarchy1ItemModelObj.sunamgnjText!,
                    style: theme.textTheme.bodySmall,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 6.v),
          Padding(
            padding: EdgeInsets.only(left: 4.h),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "lbl_894".tr,
                    style: theme.textTheme.labelLarge,
                  ),
                  TextSpan(
                    text: "lbl_person".tr,
                    style: CustomTextStyles.bodySmallff7c838d,
                  ),
                ],
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}
