import '../../../detail_feature/data/models/product_model.dart';

class HomeCategoriesModel {
  int catId;
  String title;
  List<ProductModel> products;

  HomeCategoriesModel(this.catId, this.title, this.products);
}