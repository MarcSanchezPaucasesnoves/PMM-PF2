import 'package:flutter/material.dart';
import 'package:pmm_pf2/widgets/navigation_bar_widget.dart';

class WidgetScreen extends StatefulWidget {
  WidgetScreen({Key? key}) : super(key: key);

  @override
  _WidgetScreenState createState() => _WidgetScreenState();
}

class _WidgetScreenState extends State<WidgetScreen> {
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigation bar"),
      ),
      bottomNavigationBar: _createNavigationBar(),
      body: [Text("Dismissible"), Text("ReorderableListView"), Text("GridView")][_currentPageIndex],
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

}