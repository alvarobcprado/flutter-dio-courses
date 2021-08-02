import 'package:dio_cursos/app/models/course_model/course_model.dart';
import 'package:flutter/material.dart';

import 'widgets/course_form_widget.dart';
import 'package:get/get.dart';

class CoursesView extends StatelessWidget {
  final CourseModel course =
      Get.arguments ?? CourseModel(name: "".obs, description: "".obs);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Formulário"),
      ),
      body: CourseFormWidget(course: course),
    );
  }
}
