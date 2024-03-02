// import 'models/sign_in_model.dart';
import 'package:flutter/material.dart';
import 'package:travenor/core/app_export.dart';
import 'package:travenor/core/utils/validation_functions.dart';
import 'package:travenor/presentation/home_container_screen/home_container_screen.dart';
import 'package:travenor/presentation/sign_up_screen/sign_up_screen.dart';
import 'package:travenor/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:travenor/widgets/app_bar/custom_app_bar.dart';
import 'package:travenor/widgets/custom_elevated_button.dart';
import 'package:travenor/widgets/custom_icon_button.dart';
import 'package:travenor/widgets/custom_text_form_field.dart';
import 'package:travenor/core/utils/firebase_service.dart';
import 'provider/sign_in_provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  SignInScreenState createState() => SignInScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => SignInProvider(), child: SignInScreen());
  }
}

// ignore_for_file: must_be_immutable
class SignInScreenState extends State<SignInScreen> {
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
                                horizontal: 20.h, vertical: 36.v),
                            child: Column(children: [
                              Text("lbl_sign_in_now".tr,
                                  style: theme.textTheme.headlineMedium),
                              SizedBox(height: 12.v),
                              Text("msg_please_sign_in_to".tr,
                                  style: CustomTextStyles.bodyLargeBluegray400),
                              SizedBox(height: 38.v),
                              Selector<SignInProvider, TextEditingController?>(
                                  selector: (context, provider) =>
                                      provider.emailController,
                                  builder: (context, emailController, child) {
                                    return CustomTextFormField(
                                        controller: emailController,
                                        hintText: "Enter your email",
                                        textInputType:
                                            TextInputType.emailAddress,
                                        validator: (value) {
                                          if (value == null ||
                                              (!isValidEmail(value,
                                                  isRequired: true))) {
                                            return "123email@gmail.com".tr;
                                          }
                                          return null;
                                        });
                                  }),
                              SizedBox(height: 24.v),
                              Selector<SignInProvider, TextEditingController?>(
                                  selector: (context, provider) =>
                                      provider.passwordController,
                                  builder:
                                      (context, passwordController, child) {
                                    return CustomTextFormField(
                                      controller: passwordController,
                                      hintText: "Enter your password",
                                      obscureText: true,
                                      validator: (value) {
                                        if (value?.isEmpty ?? true) {
                                          return "Please enter your password";
                                        }
                                        return null;
                                      },
                                    );
                                  }),
                              SizedBox(height: 16.v),
                              Align(
                                  alignment: Alignment.centerRight,
                                  child: Text("msg_forget_password".tr,
                                      style:
                                          CustomTextStyles.titleSmallPrimary)),
                              SizedBox(height: 38.v),
                              CustomElevatedButton(
                                  text: "lbl_sign_in".tr,
                                  onPressed: () {
                                    onTapSignIn(context);
                                  }),
                              SizedBox(height: 16.v),
                              CustomElevatedButton(
                                text: "Continue with Google",
                                onPressed: () async {
                                  final FirebaseService firebaseService =
                                      FirebaseService();
                                  final user =
                                      await firebaseService.signInWithGoogle();
                                  if (user != null) {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                HomeContainerScreen.builder(
                                                    context)));
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              "Google Sign-In failed. Please try again.")),
                                    );
                                  }
                                },
                              ),
                              SizedBox(height: 39.v),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 1.v),
                                        child: Text(
                                            "msg_don_t_have_an_account".tr,
                                            style: CustomTextStyles
                                                .bodyMediumSecondaryContainer)),
                                    GestureDetector(
                                        onTap: () {
                                          onTapTxtSignUp(context);
                                        },
                                        child: Padding(
                                            padding: EdgeInsets.only(left: 8.h),
                                            child: Text("lbl_sign_up".tr,
                                                style: CustomTextStyles
                                                    .titleSmallPrimary)))
                                  ]),
                              SizedBox(height: 17.v),
                              Text("lbl_or_connect".tr,
                                  style: CustomTextStyles
                                      .bodyMediumSecondaryContainer),
                              SizedBox(height: 5.v)
                            ]))))),
            bottomNavigationBar: _buildEight(context)));
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
  Widget _buildEight(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 101.h, right: 101.h, bottom: 66.v),
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

  /// Navigates to the onboardThreeScreen when the action is triggered.
  onTapBackArrow(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the homeContainerScreen when the action is triggered.
  void onTapSignIn(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      final provider = Provider.of<SignInProvider>(context, listen: false);
      String email = provider.emailController.text.trim();
      String password = provider.passwordController.text.trim();

      FirebaseService firebaseService = FirebaseService();
      bool success = await firebaseService.signInUser(email, password);

      if (success) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => HomeContainerScreen.builder(context)));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
                "Sign-in failed. Please check your credentials and try again.")));
      }
    }
  }

  /// Navigates to the signUpScreen when the action is triggered.
  onTapTxtSignUp(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return SignUpScreen.builder(context);
    }));
  }
}
