// import 'models/home_container_model.dart';
import 'package:flutter/material.dart';
import 'package:travenor/core/app_export.dart';
import 'package:travenor/presentation/home_page/home_page.dart';
import 'package:travenor/presentation/profile_screen/profile_screen.dart';
// import 'package:travenor/widgets/custom_bottom_bar.dart';
import 'provider/home_container_provider.dart';

class HomeContainerScreen extends StatefulWidget {
  const HomeContainerScreen({Key? key}) : super(key: key);

  @override
  HomeContainerScreenState createState() => HomeContainerScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => HomeContainerProvider(),
        child: HomeContainerScreen());
  }
}

// ignore_for_file: must_be_immutable
class HomeContainerScreenState extends State<HomeContainerScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  int index = 0;
  final screens = [
    const HomePage(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: screens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          backgroundColor: const Color(0xff581845),
          indicatorColor: Colors.white,
          labelTextStyle: MaterialStateProperty.all(
            const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          iconTheme: MaterialStateProperty.all(
            const IconThemeData(
              color: Colors.white,
            ),
          ),
        ),
        child: BottomNavigationBar(
          selectedItemColor: const Color(0xff581845),
          unselectedItemColor: const Color(0xff888888),
          showUnselectedLabels: true,
          currentIndex: index,
          onTap: (index) => setState(() => this.index = index),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    ));
  }

  ///Handling route based on bottom click actions
  // String getCurrentRoute(BottomBarEnum type) {
  //   switch (type) {
  //     case BottomBarEnum.Home:
  //       return "/";
  //     case BottomBarEnum.Profile:
  //       return AppRoutes.homePage;
  //     default:
  //       return "/";
  //   }
  // }

  ///Handling page based on route
  // Widget getCurrentPage(
  //   BuildContext context,
  //   String currentRoute,
  // ) {
  //   switch (currentRoute) {
  //     case AppRoutes.homePage:
  //       return HomePage.builder(context);
  //     default:
  //       return DefaultWidget();
  //   }
  // }
}
