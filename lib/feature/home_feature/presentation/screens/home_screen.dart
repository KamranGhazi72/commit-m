import 'package:cached_network_image/cached_network_image.dart';
import 'package:commitm_task/common/utils/my_colors.dart';
import 'package:commitm_task/common/utils/my_theme.dart';
import 'package:commitm_task/feature/home_feature/data/data_source/api/home_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../providers/home_categories_provider.dart';
import '../widgets/home_cat_tabbar.dart';
import '../widgets/home_header.dart';
import '../widgets/home_search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<HomeCategoriesProvider>(context, listen: false)
        .fetchCategoriesList();
    Provider.of<HomeCategoriesProvider>(context, listen: false)
        .fetchSubCategoryList(0);
    Provider.of<HomeCategoriesProvider>(context, listen: false)
        .fetchAllSpacialOffer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 36.0, vertical: 40.0),
            child: Column(
              children: [
                HomeHeader(
                  avatarUrl: HomeData().avatarUrl,
                  name: "Mahdi Forughi",
                  locName: 'Bintara, Bekasi',
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  child: HomeSearch(),
                ),
                Row(
                  children: [
                    Text(
                      "Categories",
                      style: MyThemes.lightTheme.textTheme.titleMedium,
                    )
                  ],
                ),
                const SizedBox(height: 10),
                HomeCatTabBar(),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Spacial Offer",
                      style: MyThemes.lightTheme.textTheme.titleMedium,
                    ),
                    const SizedBox(width: 5.0),
                    SvgPicture.asset("assets/images/fire-icon.svg"),
                  ],
                ),
                const SizedBox(height: 10),
                !Provider.of<HomeCategoriesProvider>(context, listen: false).offersFetchLoading?
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: Provider.of<HomeCategoriesProvider>(context, listen: false).spacialOffer.length,
                  itemBuilder: (context, index) => Provider.of<HomeCategoriesProvider>(context, listen: false).spacialOffer.isNotEmpty?Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Container(
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: MyThemes.lightTheme.colorScheme.primary,
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xFFF8F7FA),
                            spreadRadius: 4,
                            blurRadius: 12,
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 136,
                            height: 110,
                            child: CachedNetworkImage(
                              imageUrl: Provider.of<HomeCategoriesProvider>(context, listen: false).spacialOffer[index].image,
                              imageBuilder:
                                  (context, imageProvider) =>
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(6),
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                              placeholder: (context, url) =>
                              const Center(
                                child: CircularProgressIndicator(),
                              ),
                              errorWidget: (context, url, error) =>
                              const Center(
                                child: Icon(Icons.error),
                              ),
                            ),
                          ),
                          const SizedBox(width: 5.0),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(3.0),
                                decoration: BoxDecoration(
                                  color: MyThemes.lightTheme.colorScheme.secondary,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Text("limited", style: MyThemes.lightTheme.textTheme.bodySmall,),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .4,
                                child: Text(
                                  Provider.of<HomeCategoriesProvider>(context, listen: false).spacialOffer[index].adTitle,
                                  style: MyThemes.lightTheme.textTheme.titleMedium?.copyWith(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ):Container(),
                ): const Center(
                  child: CircularProgressIndicator(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
