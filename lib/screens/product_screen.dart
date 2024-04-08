import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black),
      body: Padding(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              AspectRatio(
                child: Image.network(product.imageUrl, fit: BoxFit.cover),
                aspectRatio: 4 / 3,
              ),
              SizedBox(
                height: 16,
              ),
              Align(alignment: Alignment.centerRight, child: FaIcon(FontAwesomeIcons.heart)),
              SizedBox(
                height: 16,
              ),
              Text(
                product.name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "${product.price} THB",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 16,
              ),
            ]),
          )),
      floatingActionButton: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width - 24,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(8)),
          child: Text(
            "Add to Cart",
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
