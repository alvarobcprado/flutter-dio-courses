import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/views/courses_view/courses_view.dart';
import 'app/views/home_view/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const Map<int, Color> color = {
    50: Color.fromRGBO(255, 92, 87, .1),
    100: Color.fromRGBO(255, 92, 87, .2),
    200: Color.fromRGBO(252, 215, 52, .5),
    300: Color.fromRGBO(252, 215, 52, .8),
    400: Color.fromRGBO(255, 92, 87, .5),
    500: Color.fromRGBO(255, 92, 87, .6),
    600: Color.fromRGBO(255, 92, 87, .7),
    700: Color.fromRGBO(230, 81, 0, .8),
    800: Color.fromRGBO(255, 92, 87, .9),
    900: Color.fromRGBO(255, 92, 87, 1),
  };

  static const MaterialColor colorCustom = MaterialColor(0xFFFF5C57, color);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: Colors.black12,
        ),
        appBarTheme: AppBarTheme(color: Colors.black87),
        primarySwatch: colorCustom,
        primaryColor: Color(0xFF808080),
        accentColor: colorCustom,
      ),
      darkTheme: ThemeData(
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: Colors.black,
        ),
        brightness: Brightness.dark,
        primarySwatch: colorCustom,
        accentColor: Colors.white,
      ),
      initialRoute: "/",
      getPages: [
        GetPage(name: '/', page: () => HomeView()),
        GetPage(name: '/courses', page: () => CoursesView()),
      ],
    );
  }
}
