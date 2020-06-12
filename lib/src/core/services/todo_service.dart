import 'package:devscreening/src/core/model/panel_data.dart';

class TodoService {
  List<PanelData> bottomList = List<PanelData>();
  List<PanelData> topList = List<PanelData>();

  TodoService() {
    for (int i = 0; i < 20; i++) {
      bottomList.add(
        PanelData(
          mainText: 'Item $i',
          subText1: 'SubText1 $i',
          subText2: 'SubText2 $i',
          duration: Duration(minutes: (i + 1) * 10),
        ),
      );
    }
  }

  void assign(int index) {
    if (index < bottomList.length) {
      topList.add(bottomList[index]);
      bottomList.removeAt(index);
    }
  }

  void delete(int index) {
    if (index < topList.length) {
      bottomList.add(topList[index]);
      topList.removeAt(index);
    }
  }
}
