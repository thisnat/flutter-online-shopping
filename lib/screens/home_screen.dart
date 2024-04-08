import 'package:flutter/material.dart';
import 'package:online_shopping/components/product_card.dart';
import 'package:online_shopping/models/product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> productList = Product().getMockProductList();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.93),
      itemCount: productList.length,
      shrinkWrap: true,
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        return ProductCard(
          product: productList[index],
        );
      },
    );
  }
}
