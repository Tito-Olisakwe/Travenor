// import 'models/sign_up_model.dart';
import 'package:flutter/material.dart';
import 'package:travenor/core/app_export.dart';
import 'package:travenor/core/utils/validation_functions.dart';
import 'package:travenor/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:travenor/widgets/app_bar/custom_app_bar.dart';
import 'package:travenor/widgets/custom_elevated_button.dart';
import 'package:travenor/widgets/custom_icon_button.dart';
import 'package:travenor/widgets/custom_text_form_field.dart';
import 'provider/sign_up_provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  SignUpScreenState createState() => SignUpScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => SignUpProvider(), child: SignUpScreen());
  }
}

// ignore_for_file: must_be_immutable
class SignUpScreenState extends State<SignUpScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
            body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Form(
                        key: _formKey,
                        child: Container(
                            width: double.maxFinite,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.h, vertical: 35.v),
                            child: Column(children: [
                              Text("lbl_sign_up_now".tr,
                                  style: theme.textTheme.headlineMedium),
                              SizedBox(height: 11.v),
                              Text("msg_please_fill_the".tr,
                                  style: CustomTextStyles.bodyLargeBluegray400),
                              SizedBox(height: 39.v),
                              _buildName(context),
                              SizedBox(height: 24.v),
                              _buildEmail(context),
                              SizedBox(height: 24.v),
                              _buildEyeIcon(context),
                              SizedBox(height: 15.v),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("msg_password_must_be".tr,
                                      style: CustomTextStyles.bodyMedium14)),
                              SizedBox(height: 39.v),
                              _buildSignUp(context),
                              SizedBox(height: 40.v),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("msg_already_have_an".tr,
                                        style: CustomTextStyles
                                            .bodyMediumSecondaryContainer),
                                    GestureDetector(
                                        onTap: () {
                                          onTapTxtSignIn(context);
                                        },
                                        child: Padding(
                                            padding: EdgeInsets.only(left: 8.h),
                                            child: Text("lbl_sign_in2".tr,
                                                style: CustomTextStyles
                                                    .titleSmallPrimary)))
                                  ]),
                              SizedBox(height: 17.v),
                              Text("lbl_or_connect".tr,
                                  style: CustomTextStyles
                                      .bodyMediumSecondaryContainer)
                            ]))))),
            bottomNavigationBar: _buildTen(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: double.maxFinite,
        leading: AppbarLeadingIconbutton(
            imagePath: ImageConstant.imgBackArrow,
            margin: EdgeInsets.fromLTRB(20.h, 6.v, 311.h, 6.v),
            onTap: () {
              onTapBackArrow(context);
            }));
  }

  /// Section Widget
  Widget _buildName(BuildContext context) {
    return Selector<SignUpProvider, TextEditingController?>(
        selector: (context, provider) => provider.nameController,
        builder: (context, nameController, child) {
          return CustomTextFormField(
              controller: nameController, hintText: "lbl_leonardo_smith".tr);
        });
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return Selector<SignUpProvider, TextEditingController?>(
        selector: (context, provider) => provider.emailController,
        builder: (context, emailController, child) {
          return CustomTextFormField(
              controller: emailController,
              hintText: "msg_www_uihut_gmail_com".tr,
              textInputType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || (!isValidEmail(value, isRequired: true))) {
                  return "err_msg_please_enter_valid_email".tr;
                }
                return null;
              });
        });
  }

  /// Section Widget
  Widget _buildEyeIcon(BuildContext context) {
    return Consumer<SignUpProvider>(builder: (context, provider, child) {
      return CustomTextFormField(
          controller: provider.eyeIconController,
          textInputAction: TextInputAction.done,
          suffix: InkWell(
              onTap: () {
                provider.changePasswordVisibility();
              },
              child: Container(
                  margin: EdgeInsets.all(16.h),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgEyeIcon,
                      height: 24.adaptSize,
                      width: 24.adaptSize))),
          suffixConstraints: BoxConstraints(maxHeight: 56.v),
          obscureText: provider.isShowPassword);
    });
  }

  /// Section Widget
  Widget _buildSignUp(BuildContext context) {
    return CustomElevatedButton(
        text: "lbl_sign_up2".tr,
        onPressed: () {
          onTapSignUp(context);
        });
  }

  /// Section Widget
  Widget _buildTen(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 101.h, right: 101.h, bottom: 50.v),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          CustomIconButton(
              height: 44.adaptSize,
              width: 44.adaptSize,
              child: CustomImageView(imagePath: ImageConstant.imgGroup332)),
          Padding(
              padding: EdgeInsets.only(left: 20.h),
              child: CustomIconButton(
                  height: 44.adaptSize,
                  width: 44.adaptSize,
                  padding: EdgeInsets.all(12.h),
                  child:
                      CustomImageView(imagePath: ImageConstant.imgGroup334))),
          Padding(
              padding: EdgeInsets.only(left: 20.h),
              child: CustomIconButton(
                  height: 44.adaptSize,
                  width: 44.adaptSize,
                  padding: EdgeInsets.all(10.h),
                  child: CustomImageView(imagePath: ImageConstant.imgGroup333)))
        ]));
  }

  /// Navigates to the signInScreen when the action is triggered.
  onTapBackArrow(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.signInScreen,
    );
  }

  /// Navigates to the signInScreen when the action is triggered.
  onTapSignUp(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.signInScreen,
    );
  }

  /// Navigates to the signInScreen when the action is triggered.
  onTapTxtSignIn(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.signInScreen,
    );
  }
}