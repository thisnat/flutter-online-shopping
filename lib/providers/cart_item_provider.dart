import 'package:flutter/material.dart';
import 'package:online_shopping/models/in_cart_item.dart';
import 'package:online_shopping/models/product.dart';

class CartItemProvider extends ChangeNotifier {
  List<InCartItem> inCartItemList = [];

  void addToCart(Product product) {
    if (!isProductInCart(product.id!)) {
      InCartItem temp = InCartItem(product: product, quantity: 1);
      inCartItemList.add(temp);
    }
    notifyListeners();
  }

  bool isProductInCart(String id) {
    for (var element in inCartItemList) {
      if (id == element.product.id) {
        return true;
      }
    }
    return false;
  }

  int getQuantityByProductId(String id) {
    for (var element in inCartItemList) {
      if (id == element.product.id) {
        return element.quantity;
      }
    }
    return 0;
  }

  void removeFromCartById(String id) {
    inCartItemList.removeWhere((element) => element.product.id == id);
    notifyListeners();
  }

  int getTotalPrice() {
    int total = 0;
    for (var element in inCartItemList) {
      total += element.product.price! * element.quantity;
    }

    return total;
  }

  void increaseProductQuantity(String id) {
    for (var element in inCartItemList) {
      if (id == element.product.id) {
        element.quantity++;
        notifyListeners();
        break;
      }
    }
  }

  void decreaseProductQuantity(String id) {
    for (var element in inCartItemList) {
      if (id == element.product.id) {
        element.quantity--;
        notifyListeners();
        break;
      }
    }
  }
}
