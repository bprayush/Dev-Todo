import 'package:devscreening/src/core/services/todo_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.I;

void initLocator() {
  locator.registerLazySingleton(() => TodoService());
}
