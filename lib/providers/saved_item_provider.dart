import 'package:flutter/material.dart';
import 'package:online_shopping/models/product.dart';

class SavedItemProvider extends ChangeNotifier {
  List<Product> savedProductList = [];

  bool addToSavedProductListOrRemoveWhenDupe(Product product) {
    if (!isProductSaved(product)) {
      savedProductList.add(product);
      notifyListeners();
      return true;
    } else {
      removeFromProductListById(product.id!);
      notifyListeners();
      return false;
    }
  }

  void removeFromProductListById(String id) {
    savedProductList.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  bool clearSavedProductList() {
    if (savedProductList.isEmpty) {
      return false;
    }

    savedProductList.clear();
    notifyListeners();

    return true;
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
