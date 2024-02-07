// import 'models/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:travenor/core/app_export.dart';
import 'package:travenor/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:travenor/widgets/app_bar/appbar_title.dart';
import 'package:travenor/widgets/app_bar/custom_app_bar.dart';
import 'package:travenor/widgets/custom_radio_button.dart';
import 'provider/profile_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  ProfileScreenState createState() => ProfileScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ProfileProvider(), child: ProfileScreen());
  }
}

class ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 24.v),
                child: Column(children: [
                  Container(
                      height: 96.adaptSize,
                      width: 96.adaptSize,
                      decoration: AppDecoration.fillPink.copyWith(
                          borderRadius: BorderRadiusStyle.circleBorder48),
                      child: CustomImageView(
                          imagePath: ImageConstant.imgPlay,
                          height: 82.v,
                          width: 96.h,
                          alignment: Alignment.bottomCenter)),
                  SizedBox(height: 10.v),
                  Text("lbl_leonardo".tr,
                      style: CustomTextStyles.headlineSmall_1),
                  SizedBox(height: 6.v),
                  Text("msg_leonardo_gmail_com".tr,
                      style: CustomTextStyles.bodyMedium14),
                  Spacer(),
                  _buildProfileRow(context),
                  SizedBox(height: 16.v),
                  Divider(),
                  SizedBox(height: 22.v),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.h),
                      child: _buildTravelPlaneTripRow(context,
                          travelPlaneTripImage:
                              ImageConstant.imgBookmarkBlueGray400,
                          previousTripsText: "lbl_bookmarked".tr)),
                  SizedBox(height: 16.v),
                  Divider(),
                  SizedBox(height: 22.v),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.h),
                      child: _buildTravelPlaneTripRow(context,
                          travelPlaneTripImage:
                              ImageConstant.imgTravelPlaneTrip,
                          previousTripsText: "lbl_previous_trips".tr)),
                  SizedBox(height: 16.v),
                  Divider(),
                  SizedBox(height: 22.v),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.h),
                      child: _buildTravelPlaneTripRow(context,
                          travelPlaneTripImage:
                              ImageConstant.imgSettingsBlueGray40024x24,
                          previousTripsText: "lbl_settings".tr)),
                  SizedBox(height: 16.v),
                  Divider(),
                  SizedBox(height: 22.v),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.h),
                      child: _buildTravelPlaneTripRow(context,
                          travelPlaneTripImage: ImageConstant.imgUser,
                          previousTripsText: "lbl_version".tr)),
                  SizedBox(height: 16.v),
                  Divider(),
                  SizedBox(height: 40.v)
                ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 64.h,
        leading: AppbarLeadingIconbutton(
            imagePath: ImageConstant.imgBackArrow,
            margin: EdgeInsets.only(left: 20.h, top: 6.v, bottom: 6.v),
            onTap: () {
              onTapBackArrow(context);
            }),
        centerTitle: true,
        title: AppbarTitle(text: "lbl_profile".tr));
  }

  /// Section Widget
  Widget _buildProfileRow(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Consumer<ProfileProvider>(builder: (context, provider, child) {
            return CustomRadioButton(
                text: "lbl_profile".tr,
                value: "lbl_profile".tr,
                groupValue: provider.radioGroup,
                padding: EdgeInsets.symmetric(vertical: 1.v),
                onChange: (value) {
                  provider.changeRadioButton1(value);
                });
          }),
          CustomImageView(
              imagePath: ImageConstant.imgBackArrowBlueGray400,
              height: 24.adaptSize,
              width: 24.adaptSize)
        ]));
  }

  /// Common widget
  Widget _buildTravelPlaneTripRow(
    BuildContext context, {
    required String travelPlaneTripImage,
    required String previousTripsText,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      CustomImageView(
          imagePath: travelPlaneTripImage,
          height: 24.adaptSize,
          width: 24.adaptSize),
      Padding(
          padding: EdgeInsets.only(left: 14.h, top: 3.v),
          child: Text(previousTripsText,
              style: theme.textTheme.titleMedium!
                  .copyWith(color: theme.colorScheme.onPrimary))),
      Spacer(),
      CustomImageView(
          imagePath: ImageConstant.imgBackArrowBlueGray400,
          height: 24.adaptSize,
          width: 24.adaptSize)
    ]);
  }

  /// Navigates to the homeContainerScreen when the action is triggered.
  onTapBackArrow(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.homeContainerScreen,
    );
  }
}
