import 'package:dio_cursos/app/models/course_model/course_model.dart';
import 'package:dio_cursos/app/views/activity_view/widgets/Activity_listing_widget.dart';
import 'package:dio_cursos/app/widgets/app_bar_widget.dart';
import 'package:dio_cursos/app/widgets/background_box_decoration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActivityView extends StatelessWidget {
  final CourseModel course;

  const ActivityView({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(course.name.value),
      ),
      body: Container(
        decoration: BackgroundBoxDecoration.getBoxDecoration(),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ActivityListingWidget(
                course: course,
              ),
              TextButton(
                onPressed: () => Get.defaultDialog(
                  title: "Mensagem",
                  content: Text("Meu Amigo"),
                ),
                child: Text("Adicionar Atividade"),
                style: TextButton.styleFrom(
                  padding: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
