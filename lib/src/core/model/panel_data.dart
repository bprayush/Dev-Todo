import 'package:flutter/foundation.dart';

/// Class for describing panel data
class PanelData {
  final String mainText;
  final String subText1;
  final String subText2;
  final Duration duration;

  PanelData({
    @required this.mainText,
    @required this.subText1,
    @required this.subText2,
    @required this.duration,
  });
}
