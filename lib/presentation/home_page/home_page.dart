import '../home_page/widgets/destinationlist_item_widget.dart';
import 'models/destinationlist_item_model.dart';
import 'models/home_model.dart';
import 'package:flutter/material.dart';
import 'package:travenor/core/app_export.dart';
import 'package:travenor/widgets/app_bar/appbar_image.dart';
import 'package:travenor/widgets/app_bar/appbar_subtitle_two.dart';
import 'package:travenor/widgets/app_bar/custom_app_bar.dart';
import 'provider/home_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => HomeProvider(), child: HomePage());
  }
}

class HomePageState extends State<HomePage> {
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
                padding: EdgeInsets.symmetric(vertical: 25.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          height: 100.v,
                          width: 268.h,
                          margin: EdgeInsets.only(left: 20.h),
                          child: Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Align(
                                    alignment: Alignment.center,
                                    child: SizedBox(
                                        width: 268.h,
                                        child: RichText(
                                            text: TextSpan(children: [
                                              TextSpan(
                                                  text: "lbl_explore_the".tr,
                                                  style: CustomTextStyles
                                                      .displaySmallff2d323d),
                                              TextSpan(text: " "),
                                              TextSpan(
                                                  text: "lbl_beautiful".tr,
                                                  style: CustomTextStyles
                                                      .displaySmallSemiBold),
                                              TextSpan(
                                                  text: "lbl_world".tr,
                                                  style: CustomTextStyles
                                                      .displaySmallffff7029)
                                            ]),
                                            textAlign: TextAlign.left))),
                                CustomImageView(
                                    imagePath: ImageConstant.imgSettings,
                                    height: 10.v,
                                    width: 98.h,
                                    alignment: Alignment.bottomRight,
                                    margin: EdgeInsets.only(right: 1.h))
                              ])),
                      SizedBox(height: 31.v),
                      _buildExploreDestination(context),
                      SizedBox(height: 18.v),
                      _buildDestinationList(context)
                    ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: 52.v,
        leadingWidth: 61.h,
        leading: Container(
            margin: EdgeInsets.only(left: 24.h, top: 4.v, bottom: 3.v),
            decoration: AppDecoration.fillPink
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder18),
            child: AppbarImage(imagePath: ImageConstant.imgPlay)),
        title: AppbarSubtitleTwo(
            text: "lbl_leonardo".tr, margin: EdgeInsets.only(left: 6.h)),
        styleType: Style.bgFill);
  }

  /// Section Widget
  Widget _buildExploreDestination(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("msg_best_destination".tr,
                      style: theme.textTheme.titleLarge),
                  Padding(
                      padding: EdgeInsets.symmetric(vertical: 3.v),
                      child: Text("lbl_view_all".tr,
                          style: CustomTextStyles.bodyMediumPrimary))
                ])));
  }

  /// Section Widget
  Widget _buildDestinationList(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        child: SizedBox(
            height: 384.v,
            child: Consumer<HomeProvider>(builder: (context, provider, child) {
              return ListView.separated(
                  padding: EdgeInsets.only(left: 20.h),
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 16.h);
                  },
                  itemCount:
                      provider.homeModelObj.destinationlistItemList.length,
                  itemBuilder: (context, index) {
                    DestinationlistItemModel model =
                        provider.homeModelObj.destinationlistItemList[index];
                    return DestinationlistItemWidget(model,
                        onTapViewHierarchy: () {
                      onTapViewHierarchy(context);
                    });
                  });
            })));
  }

  /// Navigates to the detailsScreen when the action is triggered.
  onTapViewHierarchy(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.detailsScreen,
    );
  }
}
