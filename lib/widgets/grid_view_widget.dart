import 'package:flutter/material.dart';

GridView getGridView({required List<int> itemList}) {
  return GridView.count(
    crossAxisCount: 3,
    crossAxisSpacing: 8,
    mainAxisSpacing: 8,
    children: List.generate(itemList.length, (index) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.primaries[index % Colors.primaries.length],
          child: Center(
            child: Text(
              "Item ${itemList[index]}", 
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),)
          ),
        ),
      );
    }),
  );
}