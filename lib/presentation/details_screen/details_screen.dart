import '../details_screen/widgets/listdetails_item_widget.dart';
import 'models/details_model.dart';
import 'models/listdetails_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:readmore/readmore.dart';
import 'package:travenor/core/app_export.dart';
import 'package:travenor/widgets/app_bar/appbar_leading_iconbutton_one.dart';
import 'package:travenor/widgets/app_bar/appbar_subtitle.dart';
import 'package:travenor/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'package:travenor/widgets/app_bar/custom_app_bar.dart';
import 'provider/details_provider.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key})
      : super(
          key: key,
        );

  @override
  DetailsScreenState createState() => DetailsScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DetailsProvider(),
      child: DetailsScreen(),
    );
  }
}

class DetailsScreenState extends State<DetailsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: 764.v,
          width: double.maxFinite,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  height: 432.v,
                  width: double.maxFinite,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgRectangle818,
                        height: 432.v,
                        width: 375.h,
                        radius: BorderRadius.circular(
                          30.h,
                        ),
                        alignment: Alignment.center,
                      ),
                      _buildAppBar(context),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.h,
                    vertical: 16.v,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusStyle.roundedBorder30,
                    image: DecorationImage(
                      image: fs.Svg(
                        ImageConstant.imgGroup414,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Opacity(
                        opacity: 0.2,
                        child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            height: 5.v,
                            width: 36.h,
                            decoration: BoxDecoration(
                              color: appTheme.blueGray400.withOpacity(0.42),
                              borderRadius: BorderRadius.circular(
                                2.h,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 25.v),
                      Text(
                        "msg_niladri_reservoir".tr,
                        style: theme.textTheme.headlineSmall,
                      ),
                      SizedBox(height: 7.v),
                      Text(
                        "msg_tekergat_sunamgnj".tr,
                        style: theme.textTheme.bodyMedium,
                      ),
                      SizedBox(height: 24.v),
                      _buildRowFortyFour(context),
                      SizedBox(height: 24.v),
                      _buildListDetails(context),
                      SizedBox(height: 25.v),
                      Text(
                        "msg_about_destination".tr,
                        style: theme.textTheme.titleLarge,
                      ),
                      SizedBox(height: 13.v),
                      SizedBox(
                        width: 306.h,
                        child: ReadMoreText(
                          "msg_you_will_get_a_complete".tr,
                          trimLines: 4,
                          colorClickableText: appTheme.deepOrangeA200,
                          trimMode: TrimMode.Line,
                          trimCollapsedText: "lbl_read_more".tr,
                          moreStyle: CustomTextStyles.bodyMedium13.copyWith(
                            height: 1.69,
                          ),
                          lessStyle: CustomTextStyles.bodyMedium13.copyWith(
                            height: 1.69,
                          ),
                        ),
                      ),
                      SizedBox(height: 82.v),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 52.v,
      leadingWidth: 64.h,
      leading: AppbarLeadingIconbuttonOne(
        imagePath: ImageConstant.imgBackArrowWhiteA700,
        margin: EdgeInsets.only(left: 20.h),
      ),
      centerTitle: true,
      title: AppbarSubtitle(
        text: "lbl_details".tr,
      ),
      actions: [
        AppbarTrailingIconbutton(
          imagePath: ImageConstant.imgBookmarkWhiteA700,
          margin: EdgeInsets.symmetric(horizontal: 20.h),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildRowFortyFour(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 78.h,
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
                  "lbl_tekergat".tr,
                  style: theme.textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        ),
        Spacer(
          flex: 32,
        ),
        SizedBox(
          width: 38.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              Text(
                "lbl_4_7".tr,
                style: CustomTextStyles.bodyMediumOnPrimary,
              ),
            ],
          ),
        ),
        Spacer(
          flex: 67,
        ),
        Text(
          "lbl_59_person".tr,
          style: theme.textTheme.bodyMedium,
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildListDetails(BuildContext context) {
    return SizedBox(
      height: 42.v,
      child: Consumer<DetailsProvider>(
        builder: (context, provider, child) {
          return ListView.separated(
            padding: EdgeInsets.only(right: 21.h),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (
              context,
              index,
            ) {
              return SizedBox(
                width: 26.h,
              );
            },
            itemCount: provider.detailsModelObj.listdetailsItemList.length,
            itemBuilder: (context, index) {
              ListdetailsItemModel model =
                  provider.detailsModelObj.listdetailsItemList[index];
              return ListdetailsItemWidget(
                model,
              );
            },
          );
        },
      ),
    );
  }
}
