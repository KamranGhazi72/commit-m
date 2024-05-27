import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../common/utils/my_colors.dart';
import '../../../../common/utils/my_theme.dart';

class HomeSearch extends StatelessWidget {
  const HomeSearch({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController homeSearchController = TextEditingController();

    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFF8F7FA),
        border:
        Border.all(color: const Color(0xFFCBCBD4), width: 1),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            "assets/images/search-icon.svg",
            width: 25,
            height: 25,
          ),
          Expanded(
            child: TextFormField(
              controller: homeSearchController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: ' Search Coffee..',
                hintStyle: MyThemes.lightTheme.textTheme.bodySmall
                    ?.copyWith(
                  fontSize: 12,
                  color: const Color(0xFFCBCBD4),
                ),
                contentPadding:
                const EdgeInsets.symmetric(horizontal: 5.0),
              ),
              cursorColor: MyColors.blackColor,
              maxLines: 1,
              // validator: (value) {},
              style: MyThemes.lightTheme.textTheme.bodyMedium,
            ),
          ),
          InkWell(
            onTap: () {},
            child: SvgPicture.asset(
              "assets/images/filter-icon.svg",
              width: 24,
              height: 24,
            ),
          ),
        ],
      ),
    );
  }
}
