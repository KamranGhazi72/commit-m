
import 'package:flutter/material.dart';
import '../../data/data_source/api/product_data.dart';
import '../../data/models/product_model.dart';

class ProductDetailProvider extends ChangeNotifier {
  bool initialLoading = false;

  final productData = ProductData();
  ProductModel? product;

  int coffeeSizeSelected = 0;

  fetchProductById(int prodId) {
    initialLoading = true;
    for(int i = 0 ; i < productData.productListItems.length ; i++)  {
      if(productData.productListItems[i].prodId == prodId) {
        product = productData.productListItems[i];
      }
    }
    initialLoading = false;
  }


  coffeeSizeIndexSelected(int index) {
    coffeeSizeSelected = index;

    notifyListeners();
  }
}