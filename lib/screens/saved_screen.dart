import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:online_shopping/providers/saved_item_provider.dart';
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

    return ListView.builder(
      shrinkWrap: true,
      itemCount: savedItemProvider.savedProductList.length + 1,
      itemBuilder: (context, index) {
        // need to refactor this

        if (index == 0) {
          return GestureDetector(
            onTap: () {
              savedItemProvider.clearSavedProductList();
            },
            child: Padding(
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
              },
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
                    child: Image.network(savedItemProvider.savedProductList[index - 1].imageUrl!, fit: BoxFit.cover),
                    aspectRatio: 4 / 3,
                  ),
                  title: Text(
                    savedItemProvider.savedProductList[index - 1].name!,
                    style: TextStyle(overflow: TextOverflow.ellipsis),
                  ),
                  subtitle: Text("${savedItemProvider.savedProductList[index - 1].price} THB"),
                  trailing: Container(
                    margin: EdgeInsets.only(right: 8),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(360)),
                    child: Text(
                      "12",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  )));
        }
      },
    );
  }
}
