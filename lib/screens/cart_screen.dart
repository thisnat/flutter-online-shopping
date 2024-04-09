import 'package:flutter/material.dart';
import 'package:online_shopping/components/cart_item.dart';
import 'package:online_shopping/providers/cart_item_provider.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartItemProvider = Provider.of<CartItemProvider>(context);

    return Scaffold(
      body: ListView.builder(
          itemCount: cartItemProvider.inCartItemList.length,
          itemBuilder: (context, index) {
            return CartItem(product: cartItemProvider.inCartItemList[index].product);
          }
          //   if (index == 10) {
          //     return SizedBox(
          //       height: 96,
          //     );
          //   } else {
          //     return CartItem();
          //   }
          // }
          ),
      floatingActionButton: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              )
            ],
            borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text("Total : ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                Text("${cartItemProvider.getTotalPrice()} THB", style: TextStyle(fontSize: 18)),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/checkout');
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.all(Radius.circular(8))),
                child: Text(
                  "Checkout",
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
