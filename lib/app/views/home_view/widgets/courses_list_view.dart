import 'package:dio_cursos/app/models/course_model/course_model.dart';
import 'package:dio_cursos/app/repositories/course_repository/course_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class CoursesListView extends StatelessWidget {
  final CourseRepository courseRepo = Get.put(CourseRepository());

  @override
  Widget build(BuildContext context) {
    var courseList = courseRepo.findAllCourses();

    return Obx(() => ListView.separated(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (builder, index) {
            var course = courseList[index];
            return Slidable(
              direction: Axis.horizontal,
              actionPane: SlidableDrawerActionPane(),
              actionExtentRatio: 0.25,
              child: ListTile(
                leading: CircleAvatar(
                  child: course.logoImage.value,
                ),
                title: Text(
                  course.name.value,
                  style: TextStyle(color: Colors.white70),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              secondaryActions: [
                IconSlideAction(
                  caption: "Editar",
                  color: Colors.black45,
                  icon: Icons.edit,
                  onTap: () => _navigateToEdit(course),
                ),
                IconSlideAction(
                  caption: "Deletar",
                  color: Colors.red,
                  icon: Icons.delete,
                  onTap: () => _deleteCourse(course),
                ),
              ],
            );
          },
          separatorBuilder: (context, index) => Divider(),
          itemCount: courseList.length,
        ));
  }

  _navigateToEdit(CourseModel course) {
    Get.toNamed("/courses", arguments: course);
  }

  _deleteCourse(CourseModel course) {
    courseRepo.remove(course);
  }
}
