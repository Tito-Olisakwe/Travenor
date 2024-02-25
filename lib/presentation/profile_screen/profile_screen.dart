// import 'models/profile_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travenor/core/app_export.dart';
import 'package:travenor/core/utils/firebase_service.dart';
import 'package:travenor/presentation/sign_in_screen/sign_in_screen.dart';
import 'package:travenor/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:travenor/widgets/app_bar/appbar_title.dart';
import 'package:travenor/widgets/app_bar/custom_app_bar.dart';
import 'package:travenor/widgets/custom_elevated_button.dart';
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
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: FutureBuilder<Map<String, dynamic>?>(
          future: FirebaseService().fetchUserProfile(user!.uid),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                final userData = snapshot.data!;
                return Container(
                  width: double.maxFinite,
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.h, vertical: 24.v),
                  child: Column(
                    children: [
                      Container(
                        height: 96.adaptSize,
                        width: 96.adaptSize,
                        decoration: AppDecoration.fillPink.copyWith(
                            borderRadius: BorderRadiusStyle.circleBorder48),
                        child: CustomImageView(
                          imagePath: ImageConstant.imgPlay,
                          height: 82.v,
                          width: 96.h,
                          alignment: Alignment.bottomCenter,
                        ),
                      ),
                      SizedBox(height: 10.v),
                      Text(userData['name'] ?? 'No Name',
                          style: CustomTextStyles.headlineSmall_1),
                      SizedBox(height: 6.v),
                      Text(userData['email'] ?? 'No Email',
                          style: CustomTextStyles.bodyMedium14),
                      Spacer(),
                      _buildProfileRow(context, userData),
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
                      SizedBox(height: 40.v),
                      CustomElevatedButton(
                        onPressed: () => _showDeleteConfirmationDialog(context),
                        text: "Delete Profile",
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        buttonTextStyle: TextStyle(color: Colors.white),
                        width: 200.v,
                        height: 48.v,
                      )
                    ],
                  ),
                );
              } else {
                return Center(child: Text("No user data available."));
              }
            }
            return Center(child: CircularProgressIndicator());
          },
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
            margin: EdgeInsets.only(left: 20.h, top: 6.v, bottom: 6.v),
            onTap: () {
              onTapBackArrow(context);
            }),
        centerTitle: true,
        title: AppbarTitle(text: "lbl_profile".tr));
  }

  /// Section Widget
  Widget _buildProfileRow(BuildContext context, Map<String, dynamic> userData) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text("Edit Profile",
              style: CustomTextStyles
                  .bodyMedium13), // Placeholder for your actual style
          IconButton(
            icon: Icon(Icons.edit,
                color: Colors.blueGrey), // Use your CustomImageView if needed
            onPressed: () => _showEditProfileDialog(context, userData),
          )
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

/// Update user profile
void _showEditProfileDialog(
    BuildContext context, Map<String, dynamic> userData) {
  showDialog(
    context: context,
    builder: (context) {
      TextEditingController nameController =
          TextEditingController(text: userData['name']);
      TextEditingController emailController =
          TextEditingController(text: userData['email']);
      TextEditingController passwordController =
          TextEditingController(text: userData['password']);

      return AlertDialog(
        title: Text("Edit Profile"),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: "Name"),
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: "Email"),
              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(labelText: "Password"),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            child: Text("Cancel"),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: Text("Save"),
            onPressed: () async {
              bool success = await FirebaseService().updateUserProfile(
                FirebaseAuth.instance.currentUser!.uid,
                nameController.text.trim(),
                emailController.text.trim(),
                passwordController.text.trim(),
              );
              if (success) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Profile updated successfully')));
                Navigator.of(context).pop(); // Close the dialog
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Failed to update profile')));
              }
            },
          ),
        ],
      );
    },
  );
}

void _showDeleteConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Confirm Deletion"),
        content: Text(
            "Are you sure you want to delete your account? This action cannot be undone."),
        actions: <Widget>[
          TextButton(
            child: Text("Cancel"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text("Delete"),
            onPressed: () async {
              bool success = await FirebaseService().deleteUserAccount();
              if (success) {
                // Handle successful deletion, e.g., navigate to sign-in screen
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SignInScreen.builder(context);
                }));
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Account deleted successfully')));
              } else {
                // Handle failure, e.g., show an error message
                Navigator.of(context).pop(); // Close the dialog
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Failed to delete account')));
              }
            },
          ),
        ],
      );
    },
  );
}
