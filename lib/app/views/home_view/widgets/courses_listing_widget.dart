import 'package:percent_indicator/percent_indicator.dart';
import 'package:dio_cursos/app/controllers/activity_controller/activity_controller.dart';
import 'package:dio_cursos/app/controllers/course_controller/course_controller.dart';
import 'package:dio_cursos/app/models/course_model/course_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class CoursesListingWidget extends StatelessWidget {
  final courseCtrl = Get.find<CourseController>();
  final activityCtrl = Get.put<ActivityController>(ActivityController());

  @override
  Widget build(BuildContext context) {
    //var courseList = courseRepo.findAllCourses();

    return Obx(() => ListView.separated(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (builder, index) {
            var course = courseCtrl.courseList[index];
            return Slidable(
              direction: Axis.horizontal,
              actionPane: SlidableDrawerActionPane(),
              actionExtentRatio: 0.25,
              child: Obx(
                () => _buildCourseListTile(course),
              ),
              actions: [
                Obx(
                  () => Visibility(
                    visible: course.link.value.isNotEmpty,
                    child: IconSlideAction(
                      caption: "Acessar",
                      color: Colors.yellow[600],
                      icon: Icons.send,
                      onTap: () =>
                          courseCtrl.navigateToCourseWebView(course.link.value),
                    ),
                  ),
                ),
              ],
              secondaryActions: [
                IconSlideAction(
                  caption: "Editar",
                  color: Colors.black45,
                  icon: Icons.edit,
                  onTap: () => courseCtrl.navigateToEditCourse(course),
                ),
                IconSlideAction(
                  caption: "Deletar",
                  color: Colors.red,
                  icon: Icons.delete,
                  onTap: () => courseCtrl.deleteCourse(course),
                ),
              ],
            );
          },
          separatorBuilder: (context, index) => Divider(),
          itemCount: courseCtrl.courseList.length,
        ));
  }

  Widget _buildCourseListTile(CourseModel course) {
    var activities = activityCtrl.findAllActivitiesByCourse(course);
    var completedActivities =
        activities.where((e) => e.checked.value == true).length;
    return ListTile(
      leading: CircleAvatar(
        radius: 30,
        backgroundImage: course.logoImage.value.image,
        backgroundColor: Colors.transparent,
      ),
      title: Text(
        course.name.value,
        style: TextStyle(color: Colors.white),
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            course.description.value,
            style: TextStyle(color: Colors.white70),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          activities.length > 0
              ? _progressCourseBar(
                  percentCompleted: completedActivities / activities.length,
                )
              : Container(),
        ],
      ),
      onTap: () => Get.toNamed("activities", arguments: course),
    );
  }

  Widget _progressCourseBar({required double percentCompleted}) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: LinearPercentIndicator(
        width: Get.context!.width - 140,
        animation: true,
        lineHeight: 20,
        animationDuration: 1000,
        percent: percentCompleted,
        center: Text("${(percentCompleted * 100).toStringAsFixed(2)}%"),
        linearStrokeCap: LinearStrokeCap.roundAll,
        progressColor: Colors.yellow,
      ),
    );
  }
}
