// import 'models/onboard_three_model.dart';
import 'package:flutter/material.dart';
import 'package:travenor/core/app_export.dart';
import 'package:travenor/widgets/custom_elevated_button.dart';
import 'provider/onboard_three_provider.dart';

class OnboardThreeScreen extends StatefulWidget {
  const OnboardThreeScreen({Key? key}) : super(key: key);

  @override
  OnboardThreeScreenState createState() => OnboardThreeScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => OnboardThreeProvider(),
        child: OnboardThreeScreen());
  }
}

class OnboardThreeScreenState extends State<OnboardThreeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  CustomImageView(
                      imagePath: ImageConstant.img252a6624a42c117,
                      height: 396.v,
                      width: 375.h,
                      radius: BorderRadius.circular(30.h)),
                  SizedBox(height: 40.v),
                  _buildPeopleDontTakeStack(context),
                  SizedBox(height: 10.v),
                  Container(
                      width: 284.h,
                      margin: EdgeInsets.only(left: 44.h, right: 45.h),
                      child: Text("msg_to_get_the_best".tr,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: CustomTextStyles.bodyLargeGillSansMTBluegray400
                              .copyWith(height: 1.50))),
                  SizedBox(height: 5.v)
                ])),
            bottomNavigationBar: _buildNextButton(context)));
  }

  /// Section Widget
  Widget _buildPeopleDontTakeStack(BuildContext context) {
    return SizedBox(
        height: 83.v,
        width: 308.h,
        child: Stack(alignment: Alignment.bottomRight, children: [
          Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                  width: 308.h,
                  child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "msg_people_don_t_take2".tr,
                            style: CustomTextStyles.headlineLargeff1b1e28),
                        TextSpan(
                            text: "lbl_people".tr,
                            style: CustomTextStyles.headlineLargeffff7029)
                      ]),
                      textAlign: TextAlign.center))),
          CustomImageView(
              imagePath: ImageConstant.imgSettings,
              height: 10.v,
              width: 88.h,
              alignment: Alignment.bottomRight,
              margin: EdgeInsets.only(right: 44.h))
        ]));
  }

  /// Section Widget
  Widget _buildNextButton(BuildContext context) {
    return CustomElevatedButton(
        text: "lbl_next".tr,
        margin: EdgeInsets.only(left: 20.h, right: 20.h, bottom: 40.v),
        onPressed: () {
          onTapNextButton(context);
        });
  }

  /// Navigates to the signInScreen when the action is triggered.
  onTapNextButton(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.signInScreen,
    );
  }
}
