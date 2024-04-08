import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 10 + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return GestureDetector(
            onTap: () {
              print("click");
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
                  title: Text(
                    "T-Bone Slice 300g.",
                    style: TextStyle(overflow: TextOverflow.ellipsis),
                  ),
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
        }
      },
    );
  }
}
