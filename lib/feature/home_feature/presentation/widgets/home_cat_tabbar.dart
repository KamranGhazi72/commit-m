import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../../../common/utils/my_colors.dart';
import '../../../../common/utils/my_theme.dart';
import '../../../detail_feature/presentation/screens/product_detail_screen.dart';
import '../providers/home_categories_provider.dart';

class HomeCatTabBar extends StatefulWidget {
  const HomeCatTabBar({super.key});

  @override
  State<HomeCatTabBar> createState() => _HomeCatTabBarState();
}

class _HomeCatTabBarState extends State<HomeCatTabBar>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController? tabController;

    var homeCatProvider =
        Provider.of<HomeCategoriesProvider>(context, listen: false);

    tabController =
        TabController(length: homeCatProvider.cat.length, vsync: this);
    tabController.addListener(() {
      homeCatProvider.fetchSubCategoryList(
          homeCatProvider.cat[tabController!.index].catId);
    });

    return homeCatProvider.cat.isNotEmpty &&
            !homeCatProvider.initialFetchLoading
        ? Column(
            children: [
              SizedBox(
                height: 50,
                width: double.infinity,
                child: TabBar(
                  controller: tabController,
                  tabs: List.generate(
                    homeCatProvider.cat.length,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6.0, horizontal: 12.0),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/images/cappuccino-icon.svg",
                            width: 16,
                            height: 16,
                          ),
                          const SizedBox(width: 5),
                          Text(homeCatProvider.cat[index].title),
                        ],
                      ),
                    ),
                  ),
                  indicator: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(30),
                    ),
                    color: MyColors.secondColor,
                  ),
                  labelColor: MyColors.primaryColor,
                  unselectedLabelColor: MyColors.blackColor,
                  indicatorSize: TabBarIndicatorSize.label,
                  isScrollable: true,
                ),
              ),
              SizedBox(
                height: 200,
                child: !homeCatProvider.eachCatProdLoading
                    ? TabBarView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: tabController,
                        children: List.generate(
                          homeCatProvider.cat.length,
                          (index) => homeCatProvider.products.isNotEmpty
                              ? ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: homeCatProvider.products.length,
                                  itemBuilder: (context, index) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: () => Navigator.pushNamed(
                                        context,
                                        ProductDetailScreen.routeName,
                                        arguments: {
                                          "prodId": homeCatProvider
                                              .products[index].prodId
                                        },
                                      ),
                                      child: Container(
                                        padding: const EdgeInsets.all(5.0),
                                        width: 143,
                                        decoration: BoxDecoration(
                                          color: MyColors.primaryColor,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color(0xFFF8F7FA),
                                              spreadRadius: 4,
                                              blurRadius: 12,
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              height: 99,
                                              child: Stack(
                                                children: [
                                                  CachedNetworkImage(
                                                    imageUrl: homeCatProvider
                                                        .products[index].image,
                                                    imageBuilder: (context,
                                                            imageProvider) =>
                                                        Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(6),
                                                        image: DecorationImage(
                                                          image: imageProvider,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    placeholder:
                                                        (context, url) =>
                                                            const Center(
                                                      child:
                                                          CircularProgressIndicator(),
                                                    ),
                                                    errorWidget:
                                                        (context, url, error) =>
                                                            const Center(
                                                      child: Icon(Icons.error),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  homeCatProvider
                                                      .products[index].title,
                                                  style: MyThemes.lightTheme
                                                      .textTheme.titleMedium,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      homeCatProvider
                                                          .products[index]
                                                          .shortDesc,
                                                      style: MyThemes.lightTheme
                                                          .textTheme.bodySmall,
                                                    ),
                                                    Text(
                                                      "${homeCatProvider.products[index].price} k",
                                                      style: MyThemes.lightTheme
                                                          .textTheme.bodyMedium,
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.all(6),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                    color: MyColors.secondColor,
                                                  ),
                                                  child: SvgPicture.asset(
                                                      "assets/images/add-icon.svg"),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : const Center(
                                  child: Text("محصولی وجود ندارد"),
                                ),
                        ),
                      )
                    : const Center(
                        child: CircularProgressIndicator(),
                      ),
              ),
            ],
          )
        : const Center(
            child: CircularProgressIndicator(),
          );
  }
}
