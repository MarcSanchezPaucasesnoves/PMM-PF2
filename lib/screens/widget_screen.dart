import 'package:flutter/material.dart';

class WidgetScreen extends StatefulWidget {
  WidgetScreen({Key? key}) : super(key: key);

  @override
  _WidgetScreenState createState() => _WidgetScreenState();
}

class _WidgetScreenState extends State<WidgetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main widget"),
      ),
    );
  }
}