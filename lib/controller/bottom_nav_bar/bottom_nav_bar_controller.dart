import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class BottomNavBarProvider with ChangeNotifier {
  int currentIndex = 0;

  int currentIndexsearch() {
    return currentIndex;
  }

  void newIndex(int newIndex) {
    currentIndex = newIndex;
    notifyListeners();
  }
}
