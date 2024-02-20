import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

// import 'package:provider/provider.dart';
import 'package:travenor/presentation/app_navigation_screen/provider/app_navigation_provider.dart';
import 'package:travenor/presentation/details_screen/provider/details_provider.dart';
import 'package:travenor/presentation/favorite_places_screen/provider/favorite_places_provider.dart';
import 'package:travenor/presentation/home_page/provider/home_provider.dart';
import 'package:travenor/presentation/onboard_three_screen/provider/onboard_three_provider.dart';
import 'package:travenor/presentation/popular_places_screen/provider/popular_places_provider.dart';
import 'package:travenor/presentation/profile_screen/provider/profile_provider.dart';
import 'package:travenor/presentation/search_screen/provider/search_provider.dart';
import 'package:travenor/presentation/sign_in_screen/provider/sign_in_provider.dart';
import 'package:travenor/presentation/sign_up_screen/provider/sign_up_provider.dart';
import 'package:travenor/presentation/splash_screen/provider/splash_provider.dart';
import 'core/app_export.dart';

// Import all screens for easy testing
import 'presentation/splash_screen/splash_screen.dart';
import 'presentation/onboard_three_screen/onboard_three_screen.dart';
import 'presentation/sign_in_screen/sign_in_screen.dart';
import 'presentation/sign_up_screen/sign_up_screen.dart';
import 'presentation/home_container_screen/home_container_screen.dart';
import 'presentation/details_screen/details_screen.dart';
import 'presentation/popular_places_screen/popular_places_screen.dart';
import 'presentation/profile_screen/profile_screen.dart';
import 'presentation/favorite_places_screen/favorite_places_screen.dart';
import 'presentation/search_screen/search_screen.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
void main(){
  WidgetsFlutterBinding.ensureInitialized();
  Future.wait([
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]),
    PrefUtils().init()
  ]).then((value) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => HomeProvider()),
            ChangeNotifierProvider(create: (context) => ProfileProvider()),
            ChangeNotifierProvider(create: (context) => SearchProvider()),
            ChangeNotifierProvider(
                create: (context) => AppNavigationProvider()),
            ChangeNotifierProvider(
                create: (context) => FavoritePlacesProvider()),
            ChangeNotifierProvider(
                create: (context) => PopularPlacesProvider()),
            ChangeNotifierProvider(create: (context) => DetailsProvider()),
            ChangeNotifierProvider(create: (context) => OnboardThreeProvider()),
            ChangeNotifierProvider(create: (context) => SignInProvider()),
            ChangeNotifierProvider(create: (context) => SignUpProvider()),
            ChangeNotifierProvider(create: (context) => SplashProvider()),
            ChangeNotifierProvider(
                create: (context) => AppNavigationProvider()),
            ChangeNotifierProvider(create: (context) => ThemeProvider()),
          ],
          child: MaterialApp(
            theme: theme,
            title: 'travenor',
            navigatorKey: NavigatorService.navigatorKey,
            debugShowCheckedModeBanner: false,
            localizationsDelegates: [
              AppLocalizationDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [
              Locale('en', ''),
            ],
            // Commented out the routing system for testing
            // initialRoute: AppRoutes.initialRoute,
            // routes: AppRoutes.routes,
            // Directly load a specific screen for testing. Change the screen here as needed.
            home: SplashScreen(),
            // Examples for testing other screens:
            // home: SignInScreen(),
            // home: SignUpScreen(),
            // home: HomeContainerScreen(),
            // home: DetailsScreen(),
            // home: PopularPlacesScreen(),
            // home: ProfileScreen(),
            // home: FavoritePlacesScreen(),
            // home: SearchScreen(),
          ),
        );
      },
    );
  }
}
