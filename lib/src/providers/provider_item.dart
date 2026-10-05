import 'package:flutter/material.dart';

class ProviderItem extends ChangeNotifier {
  int _itemSelected = 0;

  PageController _pageController = PageController(initialPage: 0);

  PageController get pageController => _pageController;

  int get itemSelected => _itemSelected;

  set itemSelected(int item) {
    _itemSelected = item;
    _pageController.animateToPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.bounceIn,
      _itemSelected
    );
    notifyListeners();
  }
}
