import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:st_resume/screen/CryptoApiScreen.dart';
import 'package:st_resume/screen/HomeScreen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:st_resume/screen/TodoScreen.dart';

import 'model/TaskModel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
await Hive.openBox<Task>('tasks');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // root of the application powered by GetX
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme:
          ThemeData(primarySwatch: Colors.pink, accentColor: Colors.cyanAccent),
      initialRoute: '/home',
      getPages: [
        GetPage(name: '/home', page: () => HomeScreen()),
        GetPage(name: '/crypto_api', page: () => CryptoApiScreen()),
        GetPage(name: '/todo', page: () => TodoScreen()),
      ],
    );
  }
}
