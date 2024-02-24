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
        // Use ScaffoldMessenger to show the Snackbar directly without SnackBarAction
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Color(0xffF2F2F2),
            content: Text(
              'Bookmark added',
              style: TextStyle(color: Color(0xff581845)),
            ),
            duration: Duration(seconds: 2), // Adjust the duration as needed
            action: SnackBarAction(
              textColor: Color(0xff581845),
              label: 'Undo',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Color(0xffF2F2F2),
                    content: Text(
                      'Bookmark added',
                      style: TextStyle(color: Color(0xff581845)),
                    ),
                    duration:
                        Duration(seconds: 2), // Adjust the duration as needed
                  ),
                );
              },
            ),
          ),
        );

        // Delay the pop action to allow the Snackbar to be seen, if necessary
        Future.delayed(Duration(seconds: 2), () {
          Navigator.pop(context);
        });
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
