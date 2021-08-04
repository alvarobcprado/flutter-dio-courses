import 'package:dio_cursos/app/controllers/course_controller/course_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class CoursesListView extends StatelessWidget {
  final courseCtrl = Get.find<CourseController>();

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
              child: ListTile(
                leading: Obx(() => CircleAvatar(
                      child: course.logoImage.value,
                    )),
                title: Obx(() => Text(
                      course.name.value,
                      style: TextStyle(color: Colors.white70),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    )),
                onTap: () => courseCtrl.navigateToEditCourse(course),
              ),
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
}
