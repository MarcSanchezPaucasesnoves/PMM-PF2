import 'package:flutter/material.dart';
import 'package:pmm_pf2/widgets/dismissible_widget.dart';
import 'package:pmm_pf2/widgets/grid_view_widget.dart';
import 'package:pmm_pf2/widgets/navigation_bar_widget.dart';
import 'package:pmm_pf2/widgets/reorderable_list_widget.dart';

class WidgetScreen extends StatefulWidget {
  WidgetScreen({Key? key}) : super(key: key);

  @override
  _WidgetScreenState createState() => _WidgetScreenState();
}

class _WidgetScreenState extends State<WidgetScreen> {
  int _currentPageIndex = 0;
  final List<int> _itemList = List<int>.generate(18, (int index) => index+1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigation bar"),
      ),
      bottomNavigationBar: _createNavigationBar(),
      body: [_createDismissibleList(), _createReorderableList(), _createGridView()][_currentPageIndex],
    );
  }


  NavigationBar _createNavigationBar(){
    return getNavigationBar(
      destinations: [
        NavigationDestination(
          icon: Icon(Icons.list), 
          label: "Dismissible"
        ),
        NavigationDestination(
          icon: Icon(Icons.category), 
          label: "ReorderableListView"
        ),
        NavigationDestination(
          icon: Icon(Icons.grid_view_rounded), 
          label: "GridView"
        ),
      ], 
      currentPageIndex: _currentPageIndex, 
      onTabTapped: (index) {
        setState(() {
          _currentPageIndex = index;
        });
      }
    );
  }


  ListView _createDismissibleList(){
    return getDismissibleList(
      numberList: _itemList, 
      onRightDismiss:(index) {
        setState(() {
          _itemList.removeAt(index);
        });
      },
    );
  }


  ReorderableList _createReorderableList() {
    return getReorderableList(
      itemsList: _itemList, 
      onReorderItem:(int oldIndex, int newIndex) {
        setState(() {
          final int item = _itemList.removeAt(oldIndex);
          _itemList.insert(newIndex, item);
        });
      },
    );
  }

  GridView _createGridView() {
    return getGridView(
      itemList: _itemList,
    );
  }
}