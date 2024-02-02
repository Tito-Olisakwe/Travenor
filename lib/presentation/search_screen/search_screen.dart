import '../search_screen/widgets/viewhierarchy1_item_widget.dart';
import 'models/search_model.dart';
import 'models/viewhierarchy1_item_model.dart';
import 'package:flutter/material.dart';
import 'package:travenor/core/app_export.dart';
import 'package:travenor/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:travenor/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:travenor/widgets/app_bar/appbar_title.dart';
import 'package:travenor/widgets/app_bar/custom_app_bar.dart';
import 'package:travenor/widgets/custom_search_view.dart';
import 'provider/search_provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  SearchScreenState createState() => SearchScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => SearchProvider(), child: SearchScreen());
  }
}

class SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 19.h, vertical: 24.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(left: 1.h),
                          child:
                              Selector<SearchProvider, TextEditingController?>(
                                  selector: (context, provider) =>
                                      provider.searchController,
                                  builder: (context, searchController, child) {
                                    return CustomSearchView(
                                        controller: searchController,
                                        hintText: "lbl_search_places".tr);
                                  })),
                      SizedBox(height: 31.v),
                      Padding(
                          padding: EdgeInsets.only(left: 1.h),
                          child: Text("lbl_search_places".tr,
                              style: theme.textTheme.titleLarge)),
                      SizedBox(height: 18.v),
                      _buildViewHierarchy(context)
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
        title: AppbarTitle(text: "lbl_search".tr),
        actions: [
          AppbarSubtitleOne(
              text: "lbl_cancel".tr,
              margin: EdgeInsets.fromLTRB(20.h, 18.v, 20.h, 17.v))
        ]);
  }

  /// Section Widget
  Widget _buildViewHierarchy(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 1.h),
        child: Consumer<SearchProvider>(builder: (context, provider, child) {
          return GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 217.v,
                  crossAxisCount: 2,
                  mainAxisSpacing: 14.h,
                  crossAxisSpacing: 14.h),
              physics: NeverScrollableScrollPhysics(),
              itemCount: provider.searchModelObj.viewhierarchy1ItemList.length,
              itemBuilder: (context, index) {
                Viewhierarchy1ItemModel model =
                    provider.searchModelObj.viewhierarchy1ItemList[index];
                return Viewhierarchy1ItemWidget(model);
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
