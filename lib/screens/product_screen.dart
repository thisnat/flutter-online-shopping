import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:online_shopping/providers/cart_item_provider.dart';
import 'package:online_shopping/providers/saved_item_provider.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;
    final product = arguments["product"];
    final savedItemProvider = Provider.of<SavedItemProvider>(context);
    final cartItemProvider = Provider.of<CartItemProvider>(context);

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              AspectRatio(
                aspectRatio: 4 / 3,
                child: Image.network(product.imageUrl, fit: BoxFit.cover),
              ),
              const SizedBox(
                height: 16,
              ),
              GestureDetector(
                  onTap: () {
                    savedItemProvider.addToSavedProductListOrRemoveWhenDupe(product);
                  },
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: FaIcon(savedItemProvider.isProductSaved(product) ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart))),
              const SizedBox(
                height: 16,
              ),
              Text(
                product.name,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "${product.price} THB",
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 16,
              ),
            ]),
          )),
      floatingActionButton: SafeArea(
        child: GestureDetector(
          onTap: () {
            if (!cartItemProvider.isProductInCart(product.id)) {
              print("add to cart");
              cartItemProvider.addToCart(product);
            }
          },
          child: Container(
            width: MediaQuery.of(context).size.width - 24,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: cartItemProvider.isProductInCart(product.id) ? Colors.grey : Colors.black, borderRadius: BorderRadius.circular(8)),
            child: const Text(
              "Add to Cart",
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
