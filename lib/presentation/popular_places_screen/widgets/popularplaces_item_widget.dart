import '../models/popularplaces_item_model.dart';
import 'package:flutter/material.dart';
import 'package:travenor/core/app_export.dart';
import 'package:travenor/widgets/custom_icon_button.dart';
import 'package:travenor/widgets/custom_rating_bar.dart';

// ignore: must_be_immutable
class PopularplacesItemWidget extends StatelessWidget {
  PopularplacesItemWidget(
    this.popularplacesItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  PopularplacesItemModel popularplacesItemModelObj;

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
          SizedBox(
            height: 124.v,
            width: 137.h,
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                CustomImageView(
                  imagePath: popularplacesItemModelObj.reservoirImage,
                  height: 124.v,
                  width: 137.h,
                  radius: BorderRadius.circular(
                    16.h,
                  ),
                  alignment: Alignment.center,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 10.v,
                    right: 10.h,
                  ),
                  child: CustomIconButton(
                    height: 24.adaptSize,
                    width: 24.adaptSize,
                    padding: EdgeInsets.all(5.h),
                    decoration: IconButtonStyleHelper.fillOnPrimaryTL12,
                    alignment: Alignment.topRight,
                    child: CustomImageView(
                      imagePath: ImageConstant.imgHugeIconHealt,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 7.v),
          Padding(
            padding: EdgeInsets.only(left: 4.h),
            child: Text(
              popularplacesItemModelObj.niladriReservoir!,
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
                    popularplacesItemModelObj.tekergatText!,
                    style: theme.textTheme.bodySmall,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 6.v),
          Padding(
            padding: EdgeInsets.only(left: 4.h),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 1.v,
                    bottom: 2.v,
                  ),
                  child: CustomRatingBar(
                    ignoreGestures: true,
                    initialRating: 3,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 4.h),
                  child: Text(
                    popularplacesItemModelObj.fortySeven!,
                    style: CustomTextStyles.bodySmallOnPrimary_1,
                  ),
                ),
              ],
            ),
          ),
          // SizedBox(height: 7.v),
          Padding(
            padding: EdgeInsets.only(left: 4.h),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "lbl_459".tr,
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
