import 'package:flutter/material.dart';

NavigationBar getNavigationBar({required List<NavigationDestination> destinations, required int currentPageIndex, required Function(int) onTabTapped}) {
  return NavigationBar(
    destinations: destinations,
    selectedIndex: currentPageIndex,
    onDestinationSelected: onTabTapped,
    animationDuration: Duration(milliseconds: 500),
  );
}