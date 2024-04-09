import 'package:online_shopping/models/product.dart';

class InCartItem {
  Product product;
  int quantity;

  InCartItem({required this.product, required this.quantity});
}
