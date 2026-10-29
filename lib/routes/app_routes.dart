import 'package:flutter/material.dart';
import '../screens/screens.dart';

Map<String, WidgetBuilder> getRoutes() {
  return <String, WidgetBuilder>{
    "/" : (BuildContext context) => HomeScreen(),
    "/personal_screen" : (BuildContext context) => PersonalScreen(),
    "/widget_screen" : (BuildContext context) => WidgetScreen(),
  };
}