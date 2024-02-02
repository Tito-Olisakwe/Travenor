import 'package:flutter/material.dart';
import 'package:travenor/core/app_export.dart';
import 'package:travenor/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class AppbarTrailingIconbutton extends StatelessWidget {
  AppbarTrailingIconbutton({
    Key? key,
    this.imagePath,
    this.margin,
    this.onTap,
  }) : super(
          key: key,
        );

  String? imagePath;

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: CustomIconButton(
          height: 44.adaptSize,
          width: 44.adaptSize,
          decoration: IconButtonStyleHelper.fillOnPrimaryTL22,
          child: CustomImageView(
            imagePath: ImageConstant.imgBookmarkWhiteA700,
          ),
        ),
      ),
    );
  }
}
