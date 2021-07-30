import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/views/courses_view/courses_view.dart';
import 'app/views/home_view/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      getPages: [
        GetPage(name: '/', page: () => HomeView()),
        GetPage(name: '/courses', page: () => CoursesView()),
      ],
    );
  }
}
