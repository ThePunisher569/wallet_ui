import 'package:flutter/foundation.dart';

class WalletNavigationState extends ChangeNotifier {
  bool isExpanded = true;

  void toggle() {
    isExpanded = !isExpanded;
    notifyListeners();
  }
}
