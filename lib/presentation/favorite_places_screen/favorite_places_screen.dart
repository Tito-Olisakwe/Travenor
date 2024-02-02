import '../favorite_places_screen/widgets/viewhierarchy_item_widget.dart';
import 'models/favorite_places_model.dart';
import 'models/viewhierarchy_item_model.dart';
import 'package:flutter/material.dart';
import 'package:travenor/core/app_export.dart';
import 'package:travenor/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:travenor/widgets/app_bar/appbar_title.dart';
import 'package:travenor/widgets/app_bar/custom_app_bar.dart';
import 'provider/favorite_places_provider.dart';

class FavoritePlacesScreen extends StatefulWidget {
  const FavoritePlacesScreen({Key? key})
      : super(
          key: key,
        );

  @override
  FavoritePlacesScreenState createState() => FavoritePlacesScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FavoritePlacesProvider(),
      child: FavoritePlacesScreen(),
    );
  }
}

class FavoritePlacesScreenState extends State<FavoritePlacesScreen> {
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
          padding: EdgeInsets.symmetric(
            horizontal: 19.h,
            vertical: 8.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 17.v),
              Padding(
                padding: EdgeInsets.only(left: 1.h),
                child: Text(
                  "lbl_favorite_places".tr,
                  style: theme.textTheme.titleLarge,
                ),
              ),
              SizedBox(height: 18.v),
              _buildViewHierarchy(context),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 64.h,
      leading: AppbarLeadingIconbutton(
        imagePath: ImageConstant.imgBackArrow,
        margin: EdgeInsets.only(
          left: 20.h,
          top: 6.v,
          bottom: 6.v,
        ),
      ),
      centerTitle: true,
      title: AppbarTitle(
        text: "lbl_favorite_places".tr,
      ),
    );
  }

  /// Section Widget
  Widget _buildViewHierarchy(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 1.h),
      child: Consumer<FavoritePlacesProvider>(
        builder: (context, provider, child) {
          return GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 195.v,
              crossAxisCount: 2,
              mainAxisSpacing: 14.h,
              crossAxisSpacing: 14.h,
            ),
            physics: NeverScrollableScrollPhysics(),
            itemCount:
                provider.favoritePlacesModelObj.viewhierarchyItemList.length,
            itemBuilder: (context, index) {
              ViewhierarchyItemModel model =
                  provider.favoritePlacesModelObj.viewhierarchyItemList[index];
              return ViewhierarchyItemWidget(
                model,
              );
            },
          );
        },
      ),
    );
  }
}
