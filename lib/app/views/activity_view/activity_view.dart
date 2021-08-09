import 'package:dio_cursos/app/models/activity_model/activity_model.dart';
import 'package:dio_cursos/app/models/course_model/course_model.dart';

import 'package:dio_cursos/app/views/activity_view/widgets/activity_dialog_widget.dart';
import 'package:dio_cursos/app/views/activity_view/widgets/activity_listing_widget.dart';
import 'package:dio_cursos/app/widgets/app_bar_widget.dart';

import 'package:dio_cursos/app/widgets/background_box_decoration.dart';
import 'package:flutter/material.dart';

class ActivityView extends StatelessWidget {
  final CourseModel course;

  const ActivityView({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarWidget(
          title: course.name.value,
          image: CircleAvatar(
            backgroundImage: course.logoImage.value.image,
            radius: 25,
            backgroundColor: Colors.transparent,
          ),
        ),
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
                onPressed: () {
                  ActivityDialogWidget.showDialog(
                    activity: ActivityModel.empty(course: course),
                  );
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.all(10),
                  backgroundColor: Colors.black54,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  "Adicionar nova atividade",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
