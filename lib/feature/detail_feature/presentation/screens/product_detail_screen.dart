import 'package:cached_network_image/cached_network_image.dart';
import 'package:commitm_task/common/utils/my_colors.dart';
import 'package:commitm_task/common/utils/my_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../providers/product_detail_provider.dart';
import '../widgets/name_highlight.dart';
import '../widgets/product_detail_body.dart';
import '../widgets/product_detail_img.dart';

class ProductDetailScreen extends StatefulWidget {
  static const routeName = "/product_detail_screen";

  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as Map;
    Provider.of<ProductDetailProvider>(context, listen: false)
        .fetchProductById(arg["prodId"]);

    var prodProvider =
        Provider.of<ProductDetailProvider>(context, listen: false);

    return Scaffold(
      body: Stack(
        children: [
          ProductDetailImg(img: prodProvider.product!.image),
          Align(
            alignment: Alignment.center,
            child: NameHighlight(prod: prodProvider.product),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ProductDetailBody(prod: prodProvider.product),
          ),
        ],
      ),
    );
  }
}
