import 'package:get/get.dart';

class MainStore extends GetxController {
  var taskInput = ''.obs;

  void taskUpdate(RxString val) => taskInput = val;
}
