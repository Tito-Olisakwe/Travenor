import '../popular_places_screen/widgets/popularplaces_item_widget.dart';
// import 'models/popular_places_model.dart';
import 'models/popularplaces_item_model.dart';
import 'package:flutter/material.dart';
import 'package:travenor/core/app_export.dart';
import 'package:travenor/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:travenor/widgets/app_bar/appbar_title.dart';
import 'package:travenor/widgets/app_bar/custom_app_bar.dart';
import 'provider/popular_places_provider.dart';

class PopularPlacesScreen extends StatefulWidget {
  const PopularPlacesScreen({Key? key}) : super(key: key);

  @override
  PopularPlacesScreenState createState() => PopularPlacesScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => PopularPlacesProvider(),
        child: PopularPlacesScreen());
  }
}

class PopularPlacesScreenState extends State<PopularPlacesScreen> {
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
                padding: EdgeInsets.symmetric(horizontal: 19.h, vertical: 27.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(left: 1.h),
                          child: Text("msg_all_popular_places".tr,
                              style: theme.textTheme.titleLarge)),
                      SizedBox(height: 16.v),
                      _buildPopularPlaces(context)
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
        title: AppbarTitle(text: "lbl_popular_places".tr));
  }

  /// Section Widget
  Widget _buildPopularPlaces(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 1.h),
        child: Consumer<PopularPlacesProvider>(
            builder: (context, provider, child) {
          return GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 239.v,
                  crossAxisCount: 2,
                  mainAxisSpacing: 14.h,
                  crossAxisSpacing: 14.h),
              physics: NeverScrollableScrollPhysics(),
              itemCount:
                  provider.popularPlacesModelObj.popularplacesItemList.length,
              itemBuilder: (context, index) {
                PopularplacesItemModel model =
                    provider.popularPlacesModelObj.popularplacesItemList[index];
                return PopularplacesItemWidget(model);
              });
        }));
  }

  /// Navigates to the homeContainerScreen when the action is triggered.
  onTapBackArrow(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.homeContainerScreen,
    );
  }
}
