import 'package:commitm_task/common/utils/my_colors.dart';
import 'package:commitm_task/common/utils/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../providers/bottom_nav_select_provider.dart';

class BottomNav extends StatelessWidget {
  final PageController controller;

  const BottomNav({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenIndexProvider = Provider.of<BottomNavSelectProvider>(context);

    return BottomAppBar(
      height: 89,
      padding: const EdgeInsets.all(0.0),
      shape: const CircularNotchedRectangle(),
      color: const Color(0xFFF8F7FA),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 89,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: screenIndexProvider.currentScreen == 0
                      ? MyThemes.lightTheme.colorScheme.secondary
                      : const Color(0xFFF8F7FA),
                  width: 4,
                ),
              ),
            ),
            child: GestureDetector(
              onTap: () {
                screenIndexProvider.updateScreenIndex(0);
                controller.animateToPage(0,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/images/home-icon.svg",
                    colorFilter: screenIndexProvider.currentScreen == 0
                        ? ColorFilter.mode(
                            MyThemes.lightTheme.colorScheme.secondary,
                            BlendMode.srcIn)
                        : ColorFilter.mode(
                            MyColors.deactivateColor, BlendMode.srcIn),
                    width: 35,
                  ),
                  Text(
                    "Home",
                    style: MyThemes.lightTheme.textTheme.bodySmall?.copyWith(
                      color: screenIndexProvider.currentScreen == 0
                          ? MyThemes.lightTheme.colorScheme.secondary
                          : MyColors.deactivateColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 89,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: screenIndexProvider.currentScreen == 1
                      ? MyThemes.lightTheme.colorScheme.secondary
                      : const Color(0xFFF8F7FA),
                  width: 4,
                ),
              ),
            ),
            child: GestureDetector(
              onTap: () {
                screenIndexProvider.updateScreenIndex(1);
                controller.animateToPage(1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/images/favorite-icon.svg",
                    colorFilter: screenIndexProvider.currentScreen == 1
                        ? ColorFilter.mode(
                            MyThemes.lightTheme.colorScheme.secondary,
                            BlendMode.srcIn)
                        : ColorFilter.mode(
                            MyColors.deactivateColor, BlendMode.srcIn),
                    width: 35,
                  ),
                  Text(
                    "Favorite",
                    style: MyThemes.lightTheme.textTheme.bodySmall?.copyWith(
                      color: screenIndexProvider.currentScreen == 1
                          ? MyThemes.lightTheme.colorScheme.secondary
                          : MyColors.deactivateColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 89,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: screenIndexProvider.currentScreen == 2
                      ? MyThemes.lightTheme.colorScheme.secondary
                      : const Color(0xFFF8F7FA),
                  width: 4,
                ),
              ),
            ),
            child: GestureDetector(
              onTap: () {
                screenIndexProvider.updateScreenIndex(2);
                controller.animateToPage(2,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/images/cart-icon.svg",
                    colorFilter: screenIndexProvider.currentScreen == 2
                        ? ColorFilter.mode(
                            MyThemes.lightTheme.colorScheme.secondary,
                            BlendMode.srcIn)
                        : ColorFilter.mode(
                            MyColors.deactivateColor, BlendMode.srcIn),
                    width: 35,
                  ),
                  Text(
                    "Cart",
                    style: MyThemes.lightTheme.textTheme.bodySmall?.copyWith(
                      color: screenIndexProvider.currentScreen == 2
                          ? MyThemes.lightTheme.colorScheme.secondary
                          : MyColors.deactivateColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 89,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: screenIndexProvider.currentScreen == 3
                      ? MyThemes.lightTheme.colorScheme.secondary
                      : const Color(0xFFF8F7FA),
                  width: 4,
                ),
              ),
            ),
            child: GestureDetector(
              onTap: () {
                screenIndexProvider.updateScreenIndex(3);
                controller.animateToPage(3,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/images/profile-icon.svg",
                    colorFilter: screenIndexProvider.currentScreen == 3
                        ? ColorFilter.mode(
                            MyThemes.lightTheme.colorScheme.secondary,
                            BlendMode.srcIn)
                        : ColorFilter.mode(
                            MyColors.deactivateColor, BlendMode.srcIn),
                    width: 35,
                  ),
                  Text(
                    "Profile",
                    style: MyThemes.lightTheme.textTheme.bodySmall?.copyWith(
                      color: screenIndexProvider.currentScreen == 3
                          ? MyThemes.lightTheme.colorScheme.secondary
                          : MyColors.deactivateColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<bool> getDataFromPrefs() async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    final bool loggedIn = prefs.getBool('user_loggedIn') ?? false;

    return loggedIn;
  }
}
