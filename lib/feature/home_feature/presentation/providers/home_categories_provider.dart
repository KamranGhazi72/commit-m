import 'package:flutter/material.dart';
import '../../../detail_feature/data/models/product_model.dart';
import '../../data/data_source/api/home_data.dart';
import '../../data/models/home_categories_model.dart';
import '../../data/models/home_spacial_offer_model.dart';

class HomeCategoriesProvider extends ChangeNotifier {
  bool initialFetchLoading = false;
  bool eachCatProdLoading = false;
  bool offersFetchLoading = false;

  final homeData = HomeData();

  late List<HomeCategoriesModel> cat;
  late List<ProductModel> products;

  late List<HomeSpacialOfferModel> spacialOffer;

  fetchCategoriesList() {
    initialFetchLoading = true;
    cat = List.from(homeData.homeCategoriesItems);
    initialFetchLoading = false;

    // notifyListeners();
  }

  fetchSubCategoryList(int id) {
    eachCatProdLoading = true;
    for(int i = 0 ; i< homeData.homeCategoriesItems.length ; i++){
      if(homeData.homeCategoriesItems[i].catId == id) {
        products = List.from(homeData.homeCategoriesItems[i].products);
      }
    }
    eachCatProdLoading = false;
  }


  fetchAllSpacialOffer() {
    offersFetchLoading = true;
    spacialOffer = List.from(homeData.spacialOfferItems);
    offersFetchLoading = false;

    // notifyListeners();
  }
}