import 'package:flutter/material.dart';
import 'package:online_shopping/providers/cart_item_provider.dart';
import 'package:online_shopping/utils/number_formatter.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartItemProvider = Provider.of<CartItemProvider>(context);
    final String payUrl = "https://payment-api.yimplaHorm.com/checkout?price=" + cartItemProvider.getTotalPrice().toString();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(children: [
            const SizedBox(
              height: 32,
            ),
            QrImageView(
              data: payUrl,
              version: QrVersions.auto,
              size: 200.0,
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
      ),
    );
  }
}
