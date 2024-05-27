import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../common/utils/my_colors.dart';
import '../../../../common/utils/my_theme.dart';
import '../../data/models/product_model.dart';

class NameHighlight extends StatelessWidget {
  final ProductModel? prod;
  const NameHighlight({super.key, this.prod});

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;

    return Container(
      width: w,
      height: h * .4,
      color: Colors.black.withOpacity(0.25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 3.0, horizontal: 20.0),
                child: Text(
                  prod!.title,
                  style: MyThemes.lightTheme.textTheme.titleLarge,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26.0),
                child: Text(
                  prod!.shortDesc,
                  style: MyThemes.lightTheme.textTheme.titleSmall,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 26.0, vertical: 15.0),
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 8.0, vertical: 3.0),
              decoration: BoxDecoration(
                color: MyThemes.lightTheme.colorScheme.secondary,
                borderRadius: BorderRadius.circular(40.0),
              ),
              child: Row(
                children: [
                  SvgPicture.asset("assets/images/star-icon.svg"),
                  const SizedBox(width: 10.0),
                  Text(
                    prod!.rate.toString(),
                    style: MyThemes.lightTheme.textTheme.titleMedium
                        ?.copyWith(
                      color: MyColors.primaryColor,
                      fontWeight: FontWeight.bold,
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
}
