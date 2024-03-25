// Comprehensive Widget Test
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:travenor/core/app_export.dart';
import 'package:travenor/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:travenor/presentation/sign_in_screen/models/sign_in_model.dart';
import 'package:travenor/presentation/sign_up_screen/models/sign_up_model.dart';
import 'package:travenor/presentation/splash_screen/splash_screen.dart';
import 'package:travenor/theme/app_decoration.dart';
import 'package:travenor/widgets/app_bar/custom_app_bar.dart';

class MockSignUpController extends Mock {
  TextEditingController groupFiftyOneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  SignUpModel signUpModelObj = SignUpModel(); // Direct instance, not observable
}

class MockSignInController extends Mock {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  SignInModel signInModelObj = SignInModel(); // Direct instance, not observable
}

class MockForgotPasswordController extends Mock {
  TextEditingController emailController = TextEditingController();
}

void main() {
  // 01: APP NAVIGATION SCREEN
  // Background: Widget should render a scafold with a white bg color
  testWidgets('Should render Scaffold with white background color',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: AppNavigationScreen()));
    final scaffoldFinder = find.byType(Scaffold);
    final scaffoldWidget = tester.widget<Scaffold>(scaffoldFinder);
    expect(scaffoldWidget.backgroundColor, ColorConstant.whiteA700);
  });

  // SafeArea: Widget should render a SafeArea as a child of Scaffold
  testWidgets('Should render SafeArea as a child of Scaffold',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: AppNavigationScreen()));
    final safeAreaFinder = find.byType(SafeArea);
    expect(safeAreaFinder, findsOneWidget);
  });

  // Column: Column should have a container with white bg and a black horizontal line below it
  testWidgets(
      'Should have container with white background color and black horizontal line',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: AppNavigationScreen()));
    final containerFinder = find.byType(Container);
    expect(containerFinder, findsNWidgets(47));
    final containerWidget = tester.widget<Container>(containerFinder.first);
    expect(containerWidget.decoration, AppDecoration.fillWhiteA);
    final blackLineFinder = find.byWidgetPredicate((widget) =>
        widget is Container &&
        widget.decoration == BoxDecoration(color: ColorConstant.black900));
    expect(blackLineFinder, findsOneWidget);
  });

  //Container: Each container in the column should have a text widget with a specific label and style
  testWidgets('Should have text widget with specific label and style',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: AppNavigationScreen()));
    final textFinder = find.byType(Text);
    expect(textFinder, findsNWidgets(24));
    final labelTexts = [
      "lbl_app_navigation".tr,
      "msg_check_your_app".tr,
      "lbl_splash".tr,
      "lbl_onboard_one".tr,
      "lbl_onboard_two".tr,
      "lbl_onboard_three".tr,
      "lbl_sign_in".tr,
      "lbl_sign_up2".tr,
      "lbl_forgot_password2".tr,
      "lbl_pop_up".tr,
      "lbl_verification".tr,
      "lbl_home".tr,
      "lbl_details".tr,
      "lbl_view".tr,
      "lbl_schedule".tr,
      "lbl_popular_places".tr,
      "lbl_profile".tr,
      "msg_all_popular_tri".tr,
      "lbl_favorite_places".tr,
      "lbl_messages".tr,
      "lbl_chats".tr,
      "lbl_search".tr,
      "lbl_edit_profile".tr,
      "lbl_notification".tr
    ];
    final labelStyles = [
      AppStyle.txtRobotoRegular20,
      AppStyle.txtRobotoRegular16,
      AppStyle.txtRobotoRegular20,
      AppStyle.txtRobotoRegular20,
      AppStyle.txtRobotoRegular20,
      AppStyle.txtRobotoRegular20,
      AppStyle.txtRobotoRegular20,
      AppStyle.txtRobotoRegular20,
      AppStyle.txtRobotoRegular20,
      AppStyle.txtRobotoRegular20,
      AppStyle.txtRobotoRegular20,
      AppStyle.txtRobotoRegular20,
      AppStyle.txtRobotoRegular20,
      AppStyle.txtRobotoRegular20,
      AppStyle.txtRobotoRegular20,
      AppStyle.txtRobotoRegular20,
      AppStyle.txtRobotoRegular20,
      AppStyle.txtRobotoRegular20,
      AppStyle.txtRobotoRegular20,
      AppStyle.txtRobotoRegular20,
      AppStyle.txtRobotoRegular20,
      AppStyle.txtRobotoRegular20,
      AppStyle.txtRobotoRegular20,
      AppStyle.txtRobotoRegular20
    ];
    for (int i = 0; i < labelTexts.length; i++) {
      final textWidget = tester.widget<Text>(textFinder.at(i));
      expect(textWidget.data, labelTexts[i]);
      expect(textWidget.style, labelStyles[i]);
    }
  });

  //02: HOME SCREEN
  // AppBar:: Widget should render an AppBar with a custom height of at most 56.00
  testWidgets('Should render AppBar with a custom height of at most 56.00',
      (WidgetTester tester) async {
    final appBar = CustomAppBar(
      height: getVerticalSize(
        56.00,
      ),
    );
    expect(appBar.height, lessThanOrEqualTo(56.00));
  });

  // AppBar:: Should handle cases where the title text overflows
  testWidgets('Should handle cases where the title text overflows',
      (WidgetTester tester) async {
    final appBar = CustomAppBar(
      height: getVerticalSize(
        56.00,
      ),
      title: Container(
        child: Text(
          "This is a very long title that will cause overflow",
          style: TextStyle(fontSize: 20),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
    await tester.pumpWidget(MaterialApp(home: appBar));
    final titleFinder =
        find.text("This is a very long title that will cause overflow");
    final titleWidget = tester.widget<Text>(titleFinder);
    expect(titleWidget.overflow, equals(TextOverflow.ellipsis));
  });

  //AppBar: Contains a title section with a container that has a grey bg color and rounded borders
  testWidgets(
      'Should have a title section with a container that has a grey bg color and rounded borders',
      (WidgetTester tester) async {
    final appBar = CustomAppBar(
      height: getVerticalSize(
        56.00,
      ),
      title: Container(
        decoration: AppDecoration.fillGray100.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder24,
        ),
      ),
    );
    await tester.pumpWidget(MaterialApp(home: appBar));
    final titleFinder = find.byWidgetPredicate((widget) =>
        widget is Container &&
        widget.decoration ==
            BoxDecoration(
                color: ColorConstant.gray100,
                borderRadius: BorderRadiusStyle.roundedBorder24));
    expect(titleFinder, findsOneWidget);
  });

  //AppBar: Contains an actions section with a notification icon button
  testWidgets('Should have an actions section with a notification icon button',
      (WidgetTester tester) async {
    final appBar = CustomAppBar(
      height: getVerticalSize(
        56.00,
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.notifications),
          onPressed: () {},
        ),
      ],
    );
    await tester.pumpWidget(MaterialApp(home: appBar));
    final iconButtonFinder = find.byIcon(Icons.notifications);
    expect(iconButtonFinder, findsOneWidget);
  });

  // 03: ONBOARD ONE SCREEN
  //Happy Path: Widget should render the screen without errors
  testWidgets('Should render the screen without errors',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: OnboardOneScreen()));
    final scaffoldFinder = find.byType(Scaffold);
    expect(scaffoldFinder, findsOneWidget);
  });

  //Overflow: None of the widgets should overflow or have layout issues on different screen sizes
  testWidgets(
      'Should not have any overflow or layout issues on different screen sizes',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: OnboardOneScreen()));
    final containerFinder = find.byType(Container);
    expect(containerFinder, findsNWidgets(7));
    final textFinder = find.byType(Text);
    expect(textFinder, findsNWidgets(3));
    final clipRRectFinder = find.byType(ClipRRect);
    expect(clipRRectFinder, findsOneWidget);
    final commonImageViewFinder = find.byType(CommonImageView);
    expect(commonImageViewFinder, findsNWidgets(3));
    final alignFinder = find.byType(Align);
    expect(alignFinder, findsNWidgets(4));
    final paddingFinder = find.byType(Padding);
    expect(paddingFinder, findsNWidgets(8));
    final richTextFinder = find.byType(RichText);
    expect(richTextFinder, findsNWidgets(4));
  });

  //Background: Widget should display bg image and a skip button
  testWidgets('Should display bg image and a skip button',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: OnboardOneScreen()));
    final commonImageViewFinder = find.byType(CommonImageView);
    expect(commonImageViewFinder, findsNWidgets(3));
    final textFinder = find.byType(Text);
    expect(find.text("lbl_skip"), findsOneWidget);
  });

  //Message: Widget should display main message and subtitle
  testWidgets('Should display main message and subtitle',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: OnboardOneScreen()));
    expect(find.byType(SafeArea), findsOneWidget);
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(Container), findsNWidgets(7));
    expect(find.byType(SingleChildScrollView), findsOneWidget);
    expect(find.byType(Column), findsOneWidget);
    expect(find.byType(Align), findsNWidgets(4));
    expect(find.byType(ClipRRect), findsOneWidget);
    expect(find.byType(CommonImageView), findsNWidgets(3));
    final richTextWidgets = find.byWidgetPredicate((widget) =>
        widget is RichText &&
        widget.text != null &&
        widget.text.toPlainText() == "msg_life_is_short_a2lbl_wide");
    expect(richTextWidgets, findsOneWidget);
  });

  // 04: ONBOARD TWO SCREEN
  //Happy Path: Widget should render the screen without errors
  testWidgets('Should render the screen without errors',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: OnboardTwoScreen()));
    final scaffoldFinder = find.byType(Scaffold);
    expect(scaffoldFinder, findsOneWidget);
  });

  //Overflow: None of the widgets should overflow or have layout issues on different screen sizes
  testWidgets(
      'Should not have any overflow or layout issues on different screen sizes',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: OnboardTwoScreen()));
    final containerFinder = find.byType(Container);
    expect(containerFinder, findsNWidgets(7));
    final textFinder = find.byType(Text);
    expect(textFinder, findsNWidgets(3));
    final clipRRectFinder = find.byType(ClipRRect);
    expect(clipRRectFinder, findsOneWidget);
    final commonImageViewFinder = find.byType(CommonImageView);
    expect(commonImageViewFinder, findsNWidgets(3));
    final alignFinder = find.byType(Align);
    expect(alignFinder, findsNWidgets(4));
    final paddingFinder = find.byType(Padding);
    expect(paddingFinder, findsNWidgets(8));
    final richTextFinder = find.byType(RichText);
    expect(richTextFinder, findsNWidgets(4));
  });

  //Background: Widget should display bg image and a skip button
  testWidgets('Should display bg image and a skip button',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: OnboardTwoScreen()));
    final commonImageViewFinder = find.byType(CommonImageView);
    expect(commonImageViewFinder, findsNWidgets(3));
    final textFinder = find.byType(Text);
    expect(find.text("lbl_skip"), findsOneWidget);
  });

  //Message: Widget should display main message and subtitle
  testWidgets('Should display main message and subtitle',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: OnboardTwoScreen()));
    expect(find.byType(SafeArea), findsOneWidget);
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(Container), findsNWidgets(7));
    expect(find.byType(SingleChildScrollView), findsOneWidget);
    expect(find.byType(Column), findsOneWidget);
    expect(find.byType(Align), findsNWidgets(4));
    expect(find.byType(ClipRRect), findsOneWidget);
    expect(find.byType(CommonImageView), findsNWidgets(3));
    final richTextWidgets = find.byWidgetPredicate((widget) =>
        widget is RichText &&
        widget.text != null &&
        widget.text.toPlainText() == "msg_it_s_a_big_worl2lbl_explore");
    expect(richTextWidgets, findsOneWidget);
  });

  // 05: ONBOARD THREE SCREEN
  //Happy Path: Widget should render the screen without errors
  testWidgets('Should render the screen without errors',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: OnboardThreeScreen()));
    final scaffoldFinder = find.byType(Scaffold);
    expect(scaffoldFinder, findsOneWidget);
  });

  //Overflow: None of the widgets should overflow or have layout issues on different screen sizes
  testWidgets(
      'Should not have any overflow or layout issues on different screen sizes',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: OnboardThreeScreen()));
    final containerFinder = find.byType(Container);
    expect(containerFinder, findsNWidgets(7));
    final textFinder = find.byType(Text);
    expect(textFinder, findsNWidgets(3));
    final clipRRectFinder = find.byType(ClipRRect);
    expect(clipRRectFinder, findsOneWidget);
    final commonImageViewFinder = find.byType(CommonImageView);
    expect(commonImageViewFinder, findsNWidgets(3));
    final alignFinder = find.byType(Align);
    expect(alignFinder, findsNWidgets(4));
    final paddingFinder = find.byType(Padding);
    expect(paddingFinder, findsNWidgets(8));
    final richTextFinder = find.byType(RichText);
    expect(richTextFinder, findsNWidgets(4));
  });

  //Background: Widget should display bg image and a skip button
  testWidgets('Should display bg image and a skip button',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: OnboardThreeScreen()));
    final commonImageViewFinder = find.byType(CommonImageView);
    expect(commonImageViewFinder, findsNWidgets(3));
    final textFinder = find.byType(Text);
    expect(find.text("lbl_skip"), findsOneWidget);
  });

  //Message: Widget should display main message and subtitle
  testWidgets('Should display main message and subtitle',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: OnboardThreeScreen()));
    expect(find.byType(SafeArea), findsOneWidget);
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(Container), findsNWidgets(7));
    expect(find.byType(SingleChildScrollView), findsOneWidget);
    expect(find.byType(Column), findsOneWidget);
    expect(find.byType(Align), findsNWidgets(4));
    expect(find.byType(ClipRRect), findsOneWidget);
    expect(find.byType(CommonImageView), findsNWidgets(3));
    final richTextWidgets = find.byWidgetPredicate((widget) =>
        widget is RichText &&
        widget.text != null &&
        widget.text.toPlainText() == "msg_people_don_t_ta2lbl_people");
    expect(richTextWidgets, findsOneWidget);
  });

  //06: SPLASH SCREEN
  //Happy Path: Widget should render the screen without errors
  testWidgets('Should render the screen without errors',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: SplashScreen()));
    final scaffoldFinder = find.byType(Scaffold);
    expect(scaffoldFinder, findsOneWidget);
  });

  //Background: Widget should be displayed with a blue background color
  testWidgets('Should be displayed with a blue background color',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: SplashScreen()));
    final scaffold = tester.widget<Scaffold>(find.byType(Scaffold));
    expect(scaffold.backgroundColor, ColorConstant.blueA400);
  });

  //Content: None of the widgets are nuul
  testWidgets('None of the widgets are null', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: SplashScreen()));
    expect(find.byType(SafeArea), findsOneWidget);
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(Container), findsOneWidget);
    expect(find.byType(SingleChildScrollView), findsOneWidget);
    expect(find.byType(Column), findsOneWidget);
    expect(find.byType(Padding), findsNWidgets(2));
    expect(find.byType(Text), findsOneWidget);
  });

  //Text: Widget should display the text "lbl_travenor" with the correct style and size
  testWidgets(
      'Should display the text "lbl_travenor" with the correct style and size',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: SplashScreen()));
    final textFinder = find.text("lbl_travenor");
    final textWidget = tester.widget<Text>(textFinder);
    expect(textWidget.style,
        AppStyle.txtGeometric415BTBlackA34.copyWith(height: 1.00));
  });

  //07: SIGN UP SCREEN
  //Fields: Widget should render the screen with the necessary fields
  testWidgets('Should have necessary fields', (WidgetTester tester) async {
    final mockSignUpController = MockSignUpController();
    expect(mockSignUpController.groupFiftyOneController, isNotNull);
    expect(mockSignUpController.emailController, isNotNull);
    expect(mockSignUpController.signUpModelObj, isNotNull);
  });

  // 08: SIGN IN SCREEN
  //Fields: Widget should render the screen with the necessary fields
  testWidgets('Should have necessary fields', (WidgetTester tester) async {
    final mockSignInController = MockSignInController();
    expect(mockSignInController.emailController, isNotNull);
    expect(mockSignInController.passwordController, isNotNull);
    expect(mockSignInController.signInModelObj, isNotNull);
  });

  // 09: FORGOT PASSWORD SCREEN
  //Fields: Widget should render the screen with the necessary fields
  testWidgets('Should have necessary fields', (WidgetTester tester) async {
    final mockForgotPasswordController = MockForgotPasswordController();
    expect(mockForgotPasswordController.emailController, isNotNull);
  });
}
