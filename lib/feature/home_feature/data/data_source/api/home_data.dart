import '../../../../detail_feature/data/models/product_model.dart';
import '../../models/home_categories_model.dart';
import '../../models/home_spacial_offer_model.dart';

class HomeData {
  String avatarUrl =
      "https://boxprofile.ir/wp-content/uploads/2023/05/fantasy-18.jpg";

  List<HomeCategoriesModel> homeCategoriesItems = [
    HomeCategoriesModel(
      0,
      "Cappuccino",
      [
        ProductModel(
          81,
          "https://padidehshahr.com/wp-content/uploads/2022/01/9211007preview.jpg",
          "Cappuccino",
          "With Chocolate",
          ["coffee", "chocolate", "medium roasted"],
          1,
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id ipsum vivamus velit lorem amet. Tincidunt cras volutpat aliquam porttitor molestie. Netus neque, habitasse id vulputate proin cras. Neque, vel duis sit vel pellentesque tempor. A commodo arcu tortor arcu, elit.",
          50,
          4.9,
        ),
        ProductModel(
          12,
          "https://dl.bahalmag.ir/images/%D8%B9%DA%A9%D8%B3_%D9%82%D9%87%D9%88%D9%87_%D9%BE%D9%88%D8%AF%D8%B1/%D8%B9%DA%A9%D8%B3-%D9%82%D9%87%D9%88%D9%87-%D9%BE%D9%88%D8%AF%D8%B1.jpg",
          "Expresso",
          "With Low Fat Milk",
          ["coffee", "chocolate", "medium roasted"],
          2,
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id ipsum vivamus velit lorem amet. Tincidunt cras volutpat aliquam porttitor molestie. Netus neque, habitasse id vulputate proin cras. Neque, vel duis sit vel pellentesque tempor. A commodo arcu tortor arcu, elit.",
          35,
          4.0,
        ),
        ProductModel(
          12,
          "https://dl.bahalmag.ir/images/%D8%B9%DA%A9%D8%B3_%D9%82%D9%87%D9%88%D9%87_%D9%BE%D9%88%D8%AF%D8%B1/%D8%B9%DA%A9%D8%B3-%D9%82%D9%87%D9%88%D9%87-%D9%BE%D9%88%D8%AF%D8%B1.jpg",
          "Expresso",
          "With Low Fat Milk",
          ["coffee", "chocolate", "medium roasted"],
          2,
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id ipsum vivamus velit lorem amet. Tincidunt cras volutpat aliquam porttitor molestie. Netus neque, habitasse id vulputate proin cras. Neque, vel duis sit vel pellentesque tempor. A commodo arcu tortor arcu, elit.",
          35,
          4.0,
        ),
      ],
    ),
    HomeCategoriesModel(
      1,
      "Cold Brew",
      [
        ProductModel(
          345,
          "https://toranjgraph.ir/wp-content/uploads/2022/02/%D8%B9%DA%A9%D8%B3-%D9%81%D9%86%D8%AC%D8%A7%D9%86-%D9%82%D9%87%D9%88%D9%87-%D9%88-%D9%86%D8%A7%D9%86-%D9%81%D8%A7%D9%86%D8%AA%D8%B2%DB%8C.jpg",
          "Cold Brew",
          "With Low Sugar",
          ["coffee", "chocolate", "medium roasted"],
          0,
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id ipsum vivamus velit lorem amet. Tincidunt cras volutpat aliquam porttitor molestie. Netus neque, habitasse id vulputate proin cras. Neque, vel duis sit vel pellentesque tempor. A commodo arcu tortor arcu, elit.",
          45,
          4.7,
        ),
      ],
    ),
    HomeCategoriesModel(
      2,
      "Expresso",
      [
        ProductModel(
          12,
          "https://dl.bahalmag.ir/images/%D8%B9%DA%A9%D8%B3_%D9%82%D9%87%D9%88%D9%87_%D9%BE%D9%88%D8%AF%D8%B1/%D8%B9%DA%A9%D8%B3-%D9%82%D9%87%D9%88%D9%87-%D9%BE%D9%88%D8%AF%D8%B1.jpg",
          "Expresso",
          "With Low Fat Milk",
          ["coffee", "chocolate", "medium roasted"],
          2,
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id ipsum vivamus velit lorem amet. Tincidunt cras volutpat aliquam porttitor molestie. Netus neque, habitasse id vulputate proin cras. Neque, vel duis sit vel pellentesque tempor. A commodo arcu tortor arcu, elit.",
          35,
          4.0,
        ),
      ],
    ),
  ];

  List<HomeSpacialOfferModel> spacialOfferItems = [
    HomeSpacialOfferModel(
      "https://padidehshahr.com/wp-content/uploads/2022/01/9211007preview.jpg",
      "Buy 1 get 1 free if you buy with Gopay",
    ),
    HomeSpacialOfferModel(
      "https://dl.bahalmag.ir/images/%D8%B9%DA%A9%D8%B3_%D9%82%D9%87%D9%88%D9%87_%D9%BE%D9%88%D8%AF%D8%B1/%D8%B9%DA%A9%D8%B3-%D9%82%D9%87%D9%88%D9%87-%D9%BE%D9%88%D8%AF%D8%B1.jpg",
      "Buy 1 get 3 free if you buy with Comepay",
    ),
  ];
}
