
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../common/utils/my_theme.dart';
import '../../../../common/widgets/main_wrapper.dart';
import '../../data/data_source/api/intro_steps_data.dart';
import '../../data/data_source/local/intro_sharedPreference.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final pageController = PageController();
  final introData = IntroStepsData();
  bool isLastStep = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/wallpaper.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          PageView.builder(
            controller: pageController,
            physics: const BouncingScrollPhysics(),
            onPageChanged: (index) => setState(
              () => isLastStep = introData.introItem.length - 1 == index,
            ),
            itemCount: introData.introItem.length,
            itemBuilder: (context, index) => Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 230,
                      child: Column(
                        children: [
                          Text(
                            introData.introItem[index].title,
                            style: MyThemes.lightTheme.textTheme.titleLarge?.copyWith(
                              color: const Color(0xFFCBCBD4),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            introData.introItem[index].subTitle,
                            style: MyThemes.lightTheme.textTheme.titleSmall,
                          ),
                          const SizedBox(height: 20),
                          isLastStep
                              ? SmoothPageIndicator(
                                  controller: pageController,
                                  count: introData.introItem.length,
                                  onDotClicked: (index) =>
                                      pageController.animateToPage(index,
                                          duration:
                                              const Duration(milliseconds: 600),
                                          curve: Curves.easeIn),
                                  effect: const WormEffect(
                                    dotHeight: 12,
                                    dotWidth: 12,
                                    activeDotColor: Colors.green,
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    ),
                    isLastStep
                        ? getStartedBtn()
                        : Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //Skip Button
                                TextButton(
                                  onPressed: () => pageController.jumpToPage(
                                      introData.introItem.length - 1),
                                  child: Text(
                                    "Skip",
                                    style: MyThemes.lightTheme.textTheme.titleSmall,
                                  ),
                                ),

                                //Indicator
                                SmoothPageIndicator(
                                  controller: pageController,
                                  count: introData.introItem.length,
                                  onDotClicked: (index) =>
                                      pageController.animateToPage(index,
                                          duration:
                                              const Duration(milliseconds: 600),
                                          curve: Curves.easeIn),
                                  effect: const WormEffect(
                                    dotHeight: 12,
                                    dotWidth: 12,
                                    activeDotColor: Colors.green,
                                  ),
                                ),

                                //Next Button
                                TextButton(
                                  onPressed: () => pageController.nextPage(
                                      duration:
                                          const Duration(milliseconds: 600),
                                      curve: Curves.easeIn),
                                  style: TextButton.styleFrom(
                                    backgroundColor: MyThemes.lightTheme.colorScheme.secondary,
                                    padding: const EdgeInsets.all(5.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40.0),
                                    ),
                                  ),
                                  child: Text(
                                    "Next",
                                    style: MyThemes.lightTheme.textTheme.titleSmall,
                                  ),
                                ),
                              ],
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getStartedBtn() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: MyThemes.lightTheme.colorScheme.secondary,
          ),
          width: MediaQuery.of(context).size.width * .7,
          height: 64,
          child: TextButton(
            onPressed: () async {
              await IntroSharedPreferences().setIntroPageHasBeenSeen(true);
              if (!mounted) return;
              Navigator.pushNamedAndRemoveUntil(
                context,
                MainWrapper.routeName,
                ModalRoute.withName("main_wrapper"),
              );
            },
            child: Text(
              "Get started",
              style: MyThemes.lightTheme.textTheme.titleMedium,
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
