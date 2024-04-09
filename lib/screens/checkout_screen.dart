import 'package:flutter/material.dart';
import 'package:online_shopping/providers/cart_item_provider.dart';
import 'package:online_shopping/utils/number_formatter.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartItemProvider = Provider.of<CartItemProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(children: [
          const SizedBox(
            height: 32,
          ),
          AspectRatio(
            aspectRatio: 4 / 3,
            child: Image.network("https://images.unsplash.com/photo-1551028150-64b9f398f678?fit=crop&w=800&q=800", fit: BoxFit.cover),
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            "Scan & Pay",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "${cartItemProvider.getTotalPrice().toDecimalFormat()} THB",
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ]),
      ),
    );
  }
}
