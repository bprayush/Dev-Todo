import 'package:flutter/material.dart';

/// Base model for provider architecture
/// States: [busy]: true or false
class BaseModel extends ChangeNotifier {
  bool _busy = false;
  bool get busy => _busy;

  void setBusy(bool busy) {
    _busy = busy;
    notifyListeners();
  }
}
