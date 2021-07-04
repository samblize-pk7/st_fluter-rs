import 'package:hive/hive.dart';

part 'TaskModel.g.dart';

@HiveType(typeId: 1)
class Task {

  @HiveField(0)
  String task;
  @HiveField(1)
  bool state;
 Task({ this.task, this.state});

}
