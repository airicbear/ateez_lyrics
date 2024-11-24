import 'package:flutter/material.dart';

class SearchQueryNotifier extends ChangeNotifier {
  String _query = '';
  bool _enabled = false;

  String get query {
    return _query;
  }

  bool get enabled {
    return _enabled;
  }

  void setQuery(String query) {
    _query = query;
    notifyListeners();
  }

  void setEnabled(bool enabled) {
    _enabled = enabled;
    notifyListeners();
  }
}
