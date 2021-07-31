import 'package:dio_cursos/app/controllers/course_controller/course_controller.dart';
import 'package:dio_cursos/app/widgets/background_box_decoration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CourseController c = Get.put(CourseController());

    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => Text("${c.course.name}"),
        ),
        actions: [
          IconButton(
            onPressed: () => Get.toNamed("/courses"),
            icon: Icon(Icons.plus_one),
          ),
        ],
      ),
      body: Container(
        decoration: BackgroundBoxDecoration.getBoxDecoration(),
      ),
    );
  }
}
