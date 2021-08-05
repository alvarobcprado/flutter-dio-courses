import 'package:dio_cursos/app/controllers/activity_controller/activity_controller.dart';
import 'package:dio_cursos/app/models/activity_model/activity_model.dart';
import 'package:dio_cursos/app/models/course_model/course_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class ActivityListingWidget extends StatelessWidget {
  final CourseModel course;
  final ActivityController activityCtrl = Get.put(
    ActivityController(),
    permanent: true,
  );
  ActivityListingWidget({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      RxList<ActivityModel> activities =
          activityCtrl.findAllActivitiesByCourse(course);
      return ListView.separated(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: activities.length,
        itemBuilder: (builder, index) {
          var activity = activities[index];
          return Slidable(
            actionPane: SlidableDrawerActionPane(),
            actionExtentRatio: 0.25,
            child: Obx(
              () => CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                value: activity.checked.value,
                onChanged: (value) => activity.checked.value = value!,
                title: Text(
                  activity.name.value,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            secondaryActions: [
              IconSlideAction(
                caption: "Deletar",
                color: Colors.red,
                icon: Icons.delete,
                onTap: () => activityCtrl.deleteActivity(activity),
              ),
            ],
          );
        },
        separatorBuilder: (context, index) => Divider(),
      );
    });
  }
}
