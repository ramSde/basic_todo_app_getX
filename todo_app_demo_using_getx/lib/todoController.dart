import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class todocontoller extends GetxController {
  RxList<String> data = <String>[].obs;

  addNew(String task) {
    data.add(task);
  }

  deletetask(int index) {
    data.removeAt(index);
  }

  edittask(int index, String newtask) {
    data[index] = newtask;
  }
}
