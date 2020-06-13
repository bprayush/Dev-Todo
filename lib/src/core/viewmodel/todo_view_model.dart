import 'package:devscreening/src/core/model/panel_data.dart';
import 'package:devscreening/src/core/services/todo_service.dart';
import 'package:devscreening/src/core/viewmodel/base_view_model.dart';
import 'package:devscreening/src/locator.dart';

class TodoViewModel extends BaseModel {
  final TodoService _todoService = locator<TodoService>();

  List<PanelData> get topList => _todoService.topList;
  List<PanelData> get bottomList => _todoService.bottomList;

  void addToTop(int index) {
    setBusy(true);
    _todoService.assign(index);
    setBusy(false);
  }

  void removeFromTop(int index) {
    setBusy(true);
    _todoService.delete(index);
    setBusy(false);
  }
}
