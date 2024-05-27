import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../feature/home_feature/presentation/screens/home_screen.dart';
import 'bottom_nav.dart';

class MainWrapper extends StatefulWidget {
  static const routeName = "/main_wrapper";

  MainWrapper({Key? key}) : super(key: key);

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  PageController pageController = PageController();

  List<Widget> mobileScreens = [
    HomeScreen(),
    Container(color: Colors.red),
    Container(color: Colors.green),
    Container(color: Colors.yellow),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNav(controller: pageController),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: pageController,
                children: mobileScreens,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
