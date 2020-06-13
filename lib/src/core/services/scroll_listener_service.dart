import 'package:flutter/material.dart';

class ScrollListenerService {
  bool _isScrolling = false;
  ScrollController _topScrollController;
  ScrollController _bottomScrollController;

  bool get isScrolling => _isScrolling;

  void initControllers(
    ScrollController topScrollController,
    ScrollController bottomScrollController,
  ) {
    _topScrollController = topScrollController;
    _bottomScrollController = bottomScrollController;
  }

  void listen() {
    _topScrollController.addListener(() {});
    _bottomScrollController.addListener(() {
      print(_bottomScrollController.offset);
      print(_bottomScrollController.position);
    });
  }

  void dispose() {
    _topScrollController?.dispose();
    _bottomScrollController?.dispose();
  }
}
