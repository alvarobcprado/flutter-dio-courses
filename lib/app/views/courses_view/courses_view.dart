import 'package:flutter/material.dart';

import 'widgets/course_form_widget.dart';

class CoursesView extends StatelessWidget {
  const CoursesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Formulário"),
      ),
      body: CourseFormWidget(),
    );
  }
}
