import 'package:cached_network_image/cached_network_image.dart';
import 'package:commitm_task/common/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductDetailImg extends StatelessWidget {
  final String? img;
  const ProductDetailImg({super.key, this.img});

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;

    return SizedBox(
      width: w,
      height: h * .5,
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: img!,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
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
          Positioned(
            left: 20,
            top: 40,
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                height: 40,
                width: 40,
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: MyColors.primaryColor,
                  borderRadius: BorderRadius.circular(900.0),
                ),
                child: SvgPicture.asset("assets/images/arrow-back-icon.svg"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
