import 'dart:collection';

import 'package:flutter/material.dart';

class NotifyingList<T extends ChangeNotifier> extends ListBase<T>
    with ChangeNotifier {
  final List<T> _internalList = new List<T>();

  void childListener() {
    notifyListeners();
  }

  @override
  set length(int newLength) {
    _internalList.length = newLength;
  }

  @override
  int get length => _internalList.length;

  @override
  T operator [](int index) {
    // TODO: implement []
    return _internalList[index];
  }

  @override
  void operator []=(int index, T value) {
    // TODO: implement []=
    _internalList[index] = value;
  }

  @override
  void add(T element) {
    // TODO: implement add
    super.add(element);
    element.addListener(childListener);
    notifyListeners();
  }

  @override
  bool remove(Object element) {
    // TODO: implement remove
    bool result = super.remove(element);
    notifyListeners();
    return result;
  }

  @override
  void addAll(Iterable<T> iterable) {
    // TODO: implement addAll
    iterable.forEach((element) {
      this.add(element);
    });
    notifyListeners();
  }
}

class AppState with ChangeNotifier {
  final NotifyingList<PanelData> topList = new NotifyingList<PanelData>();
  final NotifyingList<PanelData> bottomList = new NotifyingList<PanelData>();

  bool _isScrolling = false;

  bool get isScrolling => _isScrolling;

  set isScrolling(bool value) {
    _isScrolling = value;
    notifyListeners();
  }

  AppState() {
    for (int i = 0; i < 20; i++) {
      bottomList.add(
        PanelData(
            mainText: 'Item $i',
            subText1: 'SubText1 $i',
            subText2: 'SubText2 $i',
            duration: new Duration(minutes: (i + 1) * 10)),
      );
    }
  }

  void movePanelToTop({@required PanelData movePanel}) {
    bottomList.remove(movePanel);
    topList.add(movePanel);
    notifyListeners();
  }

  void movePanelToBottom({@required PanelData movePanel}) {
    topList.remove(movePanel);
    bottomList.add(movePanel);
    notifyListeners();
  }
}

class PanelData with ChangeNotifier {
  final String mainText;
  final String subText1;
  final String subText2;
  final Duration duration;

  PanelData(
      {@required this.mainText,
      @required this.subText1,
      @required this.subText2,
      @required this.duration});
}
