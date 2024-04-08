import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(children: [
          SizedBox(
            height: 32,
          ),
          AspectRatio(
            child: Image.network("https://images.unsplash.com/photo-1551028150-64b9f398f678?fit=crop&w=800&q=800", fit: BoxFit.cover),
            aspectRatio: 4 / 3,
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            "Scan & Pay",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            "250 THB",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ]),
      ),
    );
  }
}
