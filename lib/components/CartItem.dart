import 'package:customizable_counter/customizable_counter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CartItem extends StatefulWidget {
  const CartItem({super.key});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: Key("test"),
        direction: DismissDirection.endToStart,
        background: Container(
            color: Colors.red,
            child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                    padding: EdgeInsets.only(right: 24),
                    child: Icon(
                      FontAwesomeIcons.trash,
                      color: Colors.white,
                    )))),
        child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 8),
            leading: AspectRatio(
              child: Image.network("https://images.unsplash.com/photo-1551028150-64b9f398f678?fit=crop&w=800&q=800", fit: BoxFit.cover),
              aspectRatio: 4 / 3,
            ),
            title: Text(
              "T-Bone Slice 300g.",
              style: TextStyle(overflow: TextOverflow.ellipsis),
            ),
            subtitle: Text("250 THB"),
            trailing: CustomizableCounter(
              borderColor: Colors.transparent,
              showButtonText: false,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              textSize: 16,
              count: 0,
              step: 1,
              minCount: 0,
              incrementIcon: const Icon(
                Icons.add,
                color: Colors.white,
              ),
              decrementIcon: const Icon(
                Icons.remove,
                color: Colors.white,
              ),
              onCountChange: (c) {
                print(c);
              },
            )));
  }
}
