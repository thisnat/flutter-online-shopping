import 'package:flutter/material.dart';
import 'package:online_shopping/components/ProductCard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.93),
      itemCount: 10,
      shrinkWrap: true,
      padding: EdgeInsets.all(16),
      itemBuilder: (context, index) {
        return ProductCard();
      },
    );
  }
}
