import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:online_shopping/models/product.dart';
import 'package:online_shopping/providers/saved_item_provider.dart';
import 'package:online_shopping/utils/number_formatter.dart';
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
        margin: const EdgeInsets.all(6),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Stack(
            children: [
              AspectRatio(
                aspectRatio: 4 / 3,
                child: Image.network(product.imageUrl!, fit: BoxFit.cover),
              ),
              Positioned(
                  top: 4,
                  right: 4,
                  child: GestureDetector(
                      onTap: () {
                        if (savedItemProvider.addToSavedProductListOrRemoveWhenDupe(product)) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text("Add to saved list"),
                          ));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text("Remove from saved list"),
                          ));
                        }
                      },
                      child: FaIcon(
                        savedItemProvider.isProductSaved(product) ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart,
                        color: Colors.white,
                      ))),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                product.name!,
                style: const TextStyle(fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis),
              ),
              Text("${product.price?.toDecimalFormat()} THB")
            ]),
          )
        ]),
      ),
    );
  }
}
