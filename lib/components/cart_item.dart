import 'package:customizable_counter/customizable_counter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:online_shopping/models/product.dart';
import 'package:online_shopping/providers/cart_item_provider.dart';
import 'package:online_shopping/utils/number_formatter.dart';
import 'package:provider/provider.dart';

class CartItem extends StatefulWidget {
  const CartItem({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    final cartItemProvider = Provider.of<CartItemProvider>(context);

    return Dismissible(
        key: Key(widget.product.id!),
        direction: DismissDirection.endToStart,
        onDismissed: (direction) {
          cartItemProvider.removeFromCartById(widget.product.id!);
        },
        background: Container(
            color: Colors.red,
            child: const Align(
                alignment: Alignment.centerRight,
                child: Padding(
                    padding: EdgeInsets.only(right: 24),
                    child: Icon(
                      FontAwesomeIcons.trash,
                      color: Colors.white,
                    )))),
        child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 8),
            leading: AspectRatio(
              aspectRatio: 4 / 3,
              child: Image.network(widget.product.imageUrl!, fit: BoxFit.cover),
            ),
            title: Text(
              widget.product.name!,
              style: const TextStyle(overflow: TextOverflow.ellipsis),
            ),
            subtitle: Text("${widget.product.price?.toDecimalFormat()} THB"),
            trailing: CustomizableCounter(
              borderColor: Colors.transparent,
              showButtonText: false,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              textSize: 16,
              count: cartItemProvider.getQuantityByProductId(widget.product.id!).toDouble(),
              step: 1,
              minCount: 1,
              incrementIcon: const Icon(
                Icons.add,
                color: Colors.white,
              ),
              decrementIcon: const Icon(
                Icons.remove,
                color: Colors.white,
              ),
              onIncrement: (c) {
                cartItemProvider.increaseProductQuantity(widget.product.id!);
              },
              onDecrement: (c) {
                cartItemProvider.decreaseProductQuantity(widget.product.id!);
              },
            )));
  }
}
