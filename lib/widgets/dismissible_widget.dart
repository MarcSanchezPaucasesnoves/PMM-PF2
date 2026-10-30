import 'package:flutter/material.dart';

ListView getDismissibleList({required List<int> numberList, required Function(int) onRightDismiss}){
  return ListView.builder(
    itemCount: numberList.length,
    padding: const EdgeInsets.symmetric(vertical: 16),
    itemBuilder: (BuildContext context, int index) {
      return Dismissible(
        background: Container(
          color: Colors.red,
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(Icons.delete, color: Colors.white,),
              SizedBox(width: 8,),
              Text("Delete", style: TextStyle(
                color: Colors.white,
              )),
            ],
          ),
        ),
        key: ValueKey<int>(numberList[index]),
        direction: DismissDirection.endToStart,
        onDismissed: (DismissDirection direction) => onRightDismiss(index),
        child: ListTile(
          title: Text("Item ${numberList[index]}"),
        ),
      );
    }
  );
}