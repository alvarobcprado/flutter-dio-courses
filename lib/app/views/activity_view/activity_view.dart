import 'package:dio_cursos/app/controllers/activity_controller/activity_controller.dart';
import 'package:dio_cursos/app/models/activity_model/activity_model.dart';
import 'package:dio_cursos/app/models/course_model/course_model.dart';

import 'package:dio_cursos/app/views/activity_view/widgets/activity_dialog_widget.dart';
import 'package:dio_cursos/app/views/activity_view/widgets/activity_listing_widget.dart';
import 'package:dio_cursos/app/widgets/app_bar_widget.dart';

import 'package:dio_cursos/app/widgets/background_box_decoration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ActivityView extends StatelessWidget {
  final CourseModel course = Get.arguments['actView'];
  final ActivityController activityCtrl = Get.put(
    ActivityController(),
    //permanent: true,
  );

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
              Container(
                child: Obx(() => _circlePercentCompletedActivities()),
              ),
              Expanded(
                child: ActivityListingWidget(
                  course: course,
                ),
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

  _circlePercentCompletedActivities() {
    var percentCompleted = activityCtrl.getActivityCompletedPercent(course);
    return Visibility(
      visible: !percentCompleted.isNaN,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: CircularPercentIndicator(
          lineWidth: 15,
          radius: 150,
          animation: true,
          animationDuration: 1000,
          percent: percentCompleted.value,
          progressColor: Colors.yellow,
          center: Text(
            "${(percentCompleted.value * 100).toStringAsFixed(2)}%",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
