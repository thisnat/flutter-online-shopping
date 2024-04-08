import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 10 + 1,
          itemBuilder: (context, index) {
            return Dismissible(
                key: Key(index.toString()),
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
                    title: Text("T-Bone Slice 300g."),
                    subtitle: Text("250 THB"),
                    trailing: Container(
                      margin: EdgeInsets.only(right: 8),
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(360)),
                      child: Text(
                        "12",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    )));
          }),
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
                Text("250 THB", style: TextStyle(fontSize: 18)),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Text(
                "Checkout",
                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
