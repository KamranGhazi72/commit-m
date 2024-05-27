
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../../../common/utils/my_colors.dart';
import '../../../../common/utils/my_theme.dart';
import '../../data/models/product_model.dart';
import '../providers/product_detail_provider.dart';

class ProductDetailBody extends StatelessWidget {
  final ProductModel? prod;

  ProductDetailBody({super.key, this.prod});

  List<String> icons = [
    "assets/images/coffee-icon.svg",
    "assets/images/chocolate-icon.svg",
    "assets/images/fire-icon.svg",
  ];

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;

    var provider = Provider.of<ProductDetailProvider>(context, listen: false);

    return Container(
      height: h * .6,
      width: w,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: MyThemes.lightTheme.colorScheme.primary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Container(
                  height: 60,
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFA6A6AA).withOpacity(0.21),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: prod!.madeWith.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                icons[index],
                                width: 25,
                                height: 25,
                              ),
                              const SizedBox(width: 10.0),
                              Padding(
                                padding: const EdgeInsets.only(right: 30.0),
                                child: Text(
                                  prod!.madeWith[index],
                                  style:
                                      MyThemes.lightTheme.textTheme.bodyMedium,
                                ),
                              ),
                            ],
                          ),
                          (prod!.madeWith.length - 1) != index
                              ? const SizedBox(
                                  height: 20,
                                  child: VerticalDivider(
                                    width: 1,
                                    color: Colors.black,
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Coffee Size",
                      style: MyThemes.lightTheme.textTheme.titleMedium,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Consumer<ProductDetailProvider>(
                    builder: (context, value, child) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () => provider.coffeeSizeIndexSelected(0),
                            child: Container(
                              width: 98,
                              padding: const EdgeInsets.symmetric(vertical: 7.0),
                              decoration: BoxDecoration(
                                color: provider.coffeeSizeSelected == 0
                                    ? MyColors.secondColor
                                    : MyColors.primaryColor,
                                borderRadius: BorderRadius.circular(30.0),
                                border: provider.coffeeSizeSelected == 0
                                    ? null
                                    : Border.all(
                                  color: MyColors.blackColor,
                                  width: 1,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "Small",
                                  style: MyThemes.lightTheme.textTheme.bodyMedium
                                      ?.copyWith(
                                    fontSize: 18,
                                    color: provider.coffeeSizeSelected == 0
                                        ? MyColors.primaryColor
                                        : MyColors.blackColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () => provider.coffeeSizeIndexSelected(1),
                            child: Container(
                              width: 98,
                              padding: const EdgeInsets.symmetric(vertical: 7.0),
                              decoration: BoxDecoration(
                                color: provider.coffeeSizeSelected == 1
                                    ? MyColors.secondColor
                                    : MyColors.primaryColor,
                                borderRadius: BorderRadius.circular(30.0),
                                border: provider.coffeeSizeSelected == 1
                                    ? null
                                    : Border.all(
                                  color: MyColors.blackColor,
                                  width: 1,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "Medium",
                                  style: MyThemes.lightTheme.textTheme.bodyMedium
                                      ?.copyWith(
                                    fontSize: 18,
                                    color: provider.coffeeSizeSelected == 1
                                        ? MyColors.primaryColor
                                        : MyColors.blackColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () => provider.coffeeSizeIndexSelected(2),
                            child: Container(
                              width: 98,
                              padding: const EdgeInsets.symmetric(vertical: 7.0),
                              decoration: BoxDecoration(
                                color: provider.coffeeSizeSelected == 2
                                    ? MyColors.secondColor
                                    : MyColors.primaryColor,
                                borderRadius: BorderRadius.circular(30.0),
                                border: provider.coffeeSizeSelected == 2
                                    ? null
                                    : Border.all(
                                  color: MyColors.blackColor,
                                  width: 1,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "Large",
                                  style: MyThemes.lightTheme.textTheme.bodyMedium
                                      ?.copyWith(
                                    fontSize: 18,
                                    color: provider.coffeeSizeSelected == 2
                                        ? MyColors.primaryColor
                                        : MyColors.blackColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "About",
                      style: MyThemes.lightTheme.textTheme.titleMedium,
                    ),
                  ],
                ),
                SizedBox(
                  height: h * .15,
                  child: SingleChildScrollView(
                    child: Text(
                      prod!.description,
                      style: MyThemes.lightTheme.textTheme.bodyMedium,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: w,
            height: 73,
            decoration: BoxDecoration(
              color: MyThemes.lightTheme.colorScheme.secondary,
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Center(
                    child: Text(
                      "Add to Cart",
                      style: MyThemes.lightTheme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 28,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 35,
                  child: VerticalDivider(
                    width: 3,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Center(
                    child: Text(
                      "${prod!.price.toString()} k",
                      style: MyThemes.lightTheme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 28,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
