import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:online_shopping/models/product.dart';
import 'package:online_shopping/providers/saved_item_provider.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    final savedItemProvider = Provider.of<SavedItemProvider>(context);

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/product', arguments: {"product": product});
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.all(6),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Stack(
            children: [
              AspectRatio(
                child: Image.network(product.imageUrl!, fit: BoxFit.cover),
                aspectRatio: 4 / 3,
              ),
              Positioned(
                  top: 4,
                  right: 4,
                  child: GestureDetector(
                      onTap: () {
                        print("heart!");
                        savedItemProvider.addToSavedProductListOrRemoveWhenDupe(product);
                      },
                      child: FaIcon(
                        savedItemProvider.isProductSaved(product) ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart,
                        color: Colors.white,
                      ))),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                product.name!,
                style: TextStyle(fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis),
              ),
              Text("${product.price} THB")
            ]),
          )
        ]),
      ),
    );
  }
}
