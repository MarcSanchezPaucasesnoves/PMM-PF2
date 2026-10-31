import 'package:flutter/material.dart';

ReorderableList getReorderableList({required List<int> itemsList, required Function(int, int) onReorderItem}) {
  return ReorderableList(
    itemCount: itemsList.length,
    itemBuilder: (BuildContext context, int index) {
      return Card(
        key: ValueKey(itemsList[index]),
        child: ListTile(
          title: Text("Item ${itemsList[index]}"),
          trailing: ReorderableDragStartListener(
            index: index,
            child: const Icon(Icons.drag_handle_rounded),
          ),
        ),
      );
    },
    onReorderItem: onReorderItem,
    // (int oldIndex, int newIndex) {
    //   setState(() {
    //     final int item = itemsList.removeAt(oldIndex);
    //     itemsList.insert(newIndex, item);
    //   });
    // },
  );
}