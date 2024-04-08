import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/product');
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.all(6),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Stack(
            children: [
              AspectRatio(
                child: Image.network("https://images.unsplash.com/photo-1551028150-64b9f398f678?fit=crop&w=200&q=200", fit: BoxFit.cover),
                aspectRatio: 4 / 3,
              ),
              Positioned(
                  top: 4,
                  right: 4,
                  child: GestureDetector(
                      onTap: () {
                        print("heart!");
                      },
                      child: FaIcon(
                        FontAwesomeIcons.heart,
                        color: Colors.white,
                      ))),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "T-Bone Slice 300g.",
                style: TextStyle(fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis),
              ),
              Text("250 THB")
            ]),
          )
        ]),
      ),
    );
  }
}
