import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../common/utils/my_colors.dart';
import '../../../../common/utils/my_theme.dart';

class HomeHeader extends StatelessWidget {
  final String avatarUrl;
  final String? name;
  final String locName;

  const HomeHeader({
    super.key,
    required this.locName,
    this.avatarUrl = "http://via.placeholder.com/200x150",
    this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CachedNetworkImage(
              imageUrl: avatarUrl,
              imageBuilder: (context, imageProvider) => Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => const Center(
                child: Icon(Icons.error),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SvgPicture.asset(
                  "assets/images/loc-icon.svg",
                  height: 20,
                ),
                const SizedBox(width: 5),
                Text(
                  locName,
                  style: MyThemes.lightTheme.textTheme.titleSmall?.copyWith(
                    color: MyColors.blackColor,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Stack(
                children: [
                  SvgPicture.asset(
                    "assets/images/alert-icon.svg",
                    height: 25,
                    width: 25,
                  ),
                  Positioned(
                    top: 3,
                    right: 0,
                    child: Container(
                      height: 6,
                      width: 6,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFfd8667),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Good morning, ",
                style: MyThemes.lightTheme.textTheme.titleMedium),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: Text(
                name ?? "Dude",
                style: MyThemes.lightTheme.textTheme.titleMedium,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
