import 'package:flutter/material.dart';
import 'package:online_shopping/models/product.dart';

class SavedItemProvider extends ChangeNotifier {
  List<Product> savedProductList = [];

  void addToSavedProductListOrRemoveWhenDupe(Product product) {
    if (!isProductSaved(product)) {
      savedProductList.add(product);
      notifyListeners();
    } else {
      removeFromProductListById(product.id!);
    }
  }

  void removeFromProductListById(String id) {
    savedProductList.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  void clearSavedProductList() {
    savedProductList.clear();
    notifyListeners();
  }

  bool isProductSaved(Product product) {
    for (var element in savedProductList) {
      if (element.id == product.id) {
        return true;
      }
    }
    return false;
  }
}
