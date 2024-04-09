import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:online_shopping/providers/cart_item_provider.dart';
import 'package:online_shopping/providers/saved_item_provider.dart';
import 'package:online_shopping/utils/number_formatter.dart';
import 'package:provider/provider.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  @override
  Widget build(BuildContext context) {
    final savedItemProvider = Provider.of<SavedItemProvider>(context);
    final cartItemProvider = Provider.of<CartItemProvider>(context);

    return ListView.builder(
      shrinkWrap: true,
      itemCount: savedItemProvider.savedProductList.length + 1,
      itemBuilder: (context, index) {
        // need to refactor this

        if (index == 0) {
          return GestureDetector(
            onTap: () {
              if (savedItemProvider.clearSavedProductList()) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Remove all items from saved list"),
                ));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Saved list already empty"),
                ));
              }
            },
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(FontAwesomeIcons.trash),
                  SizedBox(
                    width: 8,
                  ),
                  Text('Remove all'),
                ],
              ),
            ),
          );
        } else {
          return Dismissible(
              key: Key(savedItemProvider.savedProductList[index - 1].id!),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                savedItemProvider.removeFromProductListById(savedItemProvider.savedProductList[index - 1].id!);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Remove item from saved list"),
                ));
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
                    child: Image.network(savedItemProvider.savedProductList[index - 1].imageUrl!, fit: BoxFit.cover),
                  ),
                  title: Text(
                    savedItemProvider.savedProductList[index - 1].name!,
                    style: const TextStyle(overflow: TextOverflow.ellipsis),
                  ),
                  subtitle: Text("${savedItemProvider.savedProductList[index - 1].price?.toDecimalFormat()} THB"),
                  trailing: Container(
                    margin: const EdgeInsets.only(right: 8),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(360)),
                    child: Text(
                      cartItemProvider.getQuantityByProductId(savedItemProvider.savedProductList[index - 1].id!).toString(),
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  )));
        }
      },
    );
  }
}
