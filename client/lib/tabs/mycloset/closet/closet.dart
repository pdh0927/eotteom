import 'package:flutter/cupertino.dart';
import 'package:eotteom/tabs/mycloset/closet/closet_select.dart';
import 'package:eotteom/tabs/mycloset/mycloset.dart';
import 'package:flutter/material.dart';
import "package:provider/provider.dart";

import '../enrollclothes/enroll.dart';

class Closet extends StatefulWidget {
  Closet({super.key});

  @override
  State<Closet> createState() => _ClosetState();
}

class _ClosetState extends State<Closet> {
  @override
  Widget build(BuildContext context) {
    var categories = context.watch<OutfitProvider>().totalMap.keys.toList();
    var categoryPressed = context.watch<OutfitProvider>().categoryPress;
    return Column(
      children: [
        SizedBox(
          height: 40,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: context.read<OutfitProvider>().categories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: TextButton(
                    child: Text(
                      categories[index],
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Color(0xff151515),
                          decoration: categoryPressed[index]
                              ? TextDecoration.underline
                              : TextDecoration.none,
                          decorationThickness: 2,
                          fontSize: 16,
                          fontFamily: "NotoSans"),
                    ),
                    onPressed: () {
                      context.read<OutfitProvider>().selectFirstIndex(index);
                    },
                  ),
                );
              }),
        ),
        SelectCategory(),
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Align(
            child: FloatingActionButton(
              backgroundColor: Color(0xff151515),
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).push(
                      CupertinoPageRoute(builder: (ctx) => EnrollClothes()));
                },
                child: Icon(Icons.add)),
            alignment: Alignment.centerRight,
          ),
        ),
      ],
    );
  }
}
