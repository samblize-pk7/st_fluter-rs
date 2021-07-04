import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:st_resume/model/TaskModel.dart';
import 'package:st_resume/store/mainStore.dart';

class Boxes {
  static Box<Task> getTasks() => Hive.box<Task>('tasks');
}

class TodoScreen extends StatefulWidget {
  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  MainStore store;

  @override
  void initState() {
    store = Get.put(MainStore());

    super.initState();
  }

  Future addTask(String task, bool state) {
    final Task newTask = Task()
      ..task = task
      ..state = state;

    final box = Boxes.getTasks();
    box.add(newTask);
  }

  Future update(int index, bool state, String task) {
    final Task updatedTask = Task()
      ..task = task
      ..state = state;

    final box = Boxes.getTasks();
    box.putAt(index, updatedTask);
  }

  Future delete(int index) {
    final box = Boxes.getTasks();
    box.deleteAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('todo App with Database'),
      ),
      body: ValueListenableBuilder<Box<Task>>(
        valueListenable: Boxes.getTasks().listenable(),
        builder: (BuildContext context, box, _) {
          final tasks = box.values.toList().cast<Task>();
          return ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, int index) {
                return CheckboxListTile(
                  secondary: IconButton(
                    icon: Icon(
                      Icons.delete,
                    ),
                    onPressed: () {
                      delete(index);
                      Get.snackbar('The Task is Deleted', tasks[index].task,
                          snackPosition: SnackPosition.BOTTOM);
                    },
                  ),
                  value: tasks[index].state,
                  title: Text(tasks[index].task,
                      style: TextStyle(
                          color: tasks[index].state == true
                              ? Colors.grey
                              : Colors.black,
                          decoration: tasks[index].state == true
                              ? TextDecoration.lineThrough
                              : TextDecoration.none)),
                  onChanged: (value) {
                    print(value);
                    update(index, value, tasks[index].task);
                  },
                );
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Get.bottomSheet(Container(
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 20),
            color: Colors.white,
            height: 100,
            width: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                    // wrap your Column in Expanded
                    child: TextFormField(
                  onChanged: (text) {
                    store.taskUpdate(RxString(text));
                  },
                  decoration: InputDecoration(hintText: 'Add some Task ...'),
                )),

                // wrap your Column in Expanded
                ElevatedButton(
                  onPressed: () {
                    addTask(store.taskInput.value, false);
                    setState(() {});
                    Navigator.pop(context);
                    Get.snackbar('New Task Added', store.taskInput.value,
                        snackPosition: SnackPosition.BOTTOM);
                  },
                  child: Icon(Icons.send),
                ),
              ],
            ),
          ));
        },
      ),
    );
  }
}
