import 'package:flutter/material.dart';
import 'package:travenor/presentation/splash_screen/splash_screen.dart';
import 'package:travenor/presentation/onboard_three_screen/onboard_three_screen.dart';
import 'package:travenor/presentation/sign_in_screen/sign_in_screen.dart';
import 'package:travenor/presentation/sign_up_screen/sign_up_screen.dart';
import 'package:travenor/presentation/home_container_screen/home_container_screen.dart';
import 'package:travenor/presentation/details_screen/details_screen.dart';
import 'package:travenor/presentation/popular_places_screen/popular_places_screen.dart';
import 'package:travenor/presentation/profile_screen/profile_screen.dart';
import 'package:travenor/presentation/favorite_places_screen/favorite_places_screen.dart';
import 'package:travenor/presentation/search_screen/search_screen.dart';
import 'package:travenor/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String onboardThreeScreen = '/onboard_three_screen';

  static const String signInScreen = '/sign_in_screen';

  static const String signUpScreen = '/sign_up_screen';

  static const String homePage = '/home_page';

  static const String homeContainerScreen = '/home_container_screen';

  static const String detailsScreen = '/details_screen';

  static const String popularPlacesScreen = '/popular_places_screen';

  static const String profileScreen = '/profile_screen';

  static const String favoritePlacesScreen = '/favorite_places_screen';

  static const String searchScreen = '/search_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
        splashScreen: SplashScreen.builder,
        onboardThreeScreen: OnboardThreeScreen.builder,
        signInScreen: SignInScreen.builder,
        signUpScreen: SignUpScreen.builder,
        homeContainerScreen: HomeContainerScreen.builder,
        detailsScreen: DetailsScreen.builder,
        popularPlacesScreen: PopularPlacesScreen.builder,
        profileScreen: ProfileScreen.builder,
        favoritePlacesScreen: FavoritePlacesScreen.builder,
        searchScreen: SearchScreen.builder,
        appNavigationScreen: AppNavigationScreen.builder,
        initialRoute: SplashScreen.builder
      };
}
