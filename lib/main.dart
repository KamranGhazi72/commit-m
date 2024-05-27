
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'common/providers/bottom_nav_select_provider.dart';
import 'common/utils/my_theme.dart';
import 'common/widgets/main_wrapper.dart';
import 'feature/detail_feature/presentation/providers/product_detail_provider.dart';
import 'feature/detail_feature/presentation/screens/product_detail_screen.dart';
import 'feature/home_feature/presentation/providers/home_categories_provider.dart';
import 'feature/intro_feature/data/data_source/local/intro_sharedPreference.dart';
import 'feature/intro_feature/presentation/screens/intro_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final introDisplay =
      await IntroSharedPreferences().isFirstTimeIntroDisplaying();
  runApp(MyApp(introDisplay: introDisplay));
}

class MyApp extends StatelessWidget {
  final bool introDisplay;

  const MyApp({this.introDisplay = false, super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BottomNavSelectProvider()),
        ChangeNotifierProvider(create: (context) => HomeCategoriesProvider()),
        ChangeNotifierProvider(create: (context) => ProductDetailProvider()),
      ],
      child: MaterialApp(
        title: 'Commit-m Task App',
        debugShowCheckedModeBanner: false,
        theme: MyThemes.lightTheme,
        darkTheme: MyThemes.darkTheme,
        initialRoute: "/",
        routes: {
          MainWrapper.routeName: (context) => MainWrapper(),
          ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
        },
        home: introDisplay ? MainWrapper() : const IntroScreen(),
      ),
    );
  }
}
