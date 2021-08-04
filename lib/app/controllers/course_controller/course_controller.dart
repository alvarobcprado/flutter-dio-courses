import 'package:dio_cursos/app/models/course_model/course_model.dart';
import 'package:dio_cursos/app/repositories/course_repository/course_repository.dart';
import 'package:get/get.dart';

class CourseController extends GetxController {
  final CourseRepository courseRepo = CourseRepository();
  List<CourseModel> courseList = [];

  @override
  void onInit() {
    courseList = courseRepo.findAllCourses();
    super.onInit();
  }

  void navigateToEditCourse(CourseModel course) {
    Get.toNamed("/courses", arguments: course);
  }

  void deleteCourse(CourseModel course) {
    courseList.remove(course);
  }
}
