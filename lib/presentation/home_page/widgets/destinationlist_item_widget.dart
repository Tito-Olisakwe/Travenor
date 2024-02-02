import '../models/destinationlist_item_model.dart';
import 'package:flutter/material.dart';
import 'package:travenor/core/app_export.dart';
import 'package:travenor/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class DestinationlistItemWidget extends StatelessWidget {
  DestinationlistItemWidget(
    this.destinationlistItemModelObj, {
    Key? key,
    this.onTapViewHierarchy,
  }) : super(
          key: key,
        );

  DestinationlistItemModel destinationlistItemModelObj;

  VoidCallback? onTapViewHierarchy;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 268.h,
      child: Align(
        alignment: Alignment.centerRight,
        child: GestureDetector(
          onTap: () {
            onTapViewHierarchy!.call();
          },
          child: Container(
            padding: EdgeInsets.all(14.h),
            decoration: AppDecoration.outlineOnPrimaryContainer.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder24,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 286.v,
                  width: 240.h,
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      CustomImageView(
                        imagePath: destinationlistItemModelObj?.reservoirImage,
                        height: 286.v,
                        width: 240.h,
                        radius: BorderRadius.circular(
                          20.h,
                        ),
                        alignment: Alignment.center,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 14.v,
                          right: 14.h,
                        ),
                        child: CustomIconButton(
                          height: 34.adaptSize,
                          width: 34.adaptSize,
                          padding: EdgeInsets.all(8.h),
                          decoration: IconButtonStyleHelper.fillOnPrimary,
                          alignment: Alignment.topRight,
                          child: CustomImageView(
                            imagePath: ImageConstant.imgBookmark,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 14.v),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      destinationlistItemModelObj.reservoirName!,
                      style: CustomTextStyles.titleMedium18,
                    ),
                    Container(
                      width: 38.h,
                      margin: EdgeInsets.only(
                        left: 52.h,
                        top: 2.v,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgSignal,
                            height: 11.v,
                            width: 12.h,
                            margin: EdgeInsets.only(
                              top: 2.v,
                              bottom: 4.v,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 3.h),
                            child: Text(
                              destinationlistItemModelObj.ratingText!,
                              style: CustomTextStyles.bodyMediumOnPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 13.v),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 6.h),
                    child: Row(
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgLocation,
                          height: 16.adaptSize,
                          width: 16.adaptSize,
                          margin: EdgeInsets.only(bottom: 1.v),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 4.h),
                          child: Text(
                            destinationlistItemModelObj.locationText!,
                            style: theme.textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 2.v),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
