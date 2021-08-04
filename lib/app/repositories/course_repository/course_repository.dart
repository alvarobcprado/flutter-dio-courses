import 'package:dio_cursos/app/models/course_model/course_model.dart';
import 'package:get/get.dart';

class CourseRepository {
  final courses = <CourseModel>[
    CourseModel(
      name: "Teste Curso 1".obs,
      description: "Teste descrição".obs,
    ),
    CourseModel(
      name: "Teste Curso 2".obs,
      description: "Teste descrição".obs,
    ),
    CourseModel(
      name: "Teste Curso 3".obs,
      description: "Teste descrição".obs,
    ),
    CourseModel(
      name: "Teste Curso 4".obs,
      description: "Teste descrição".obs,
    ),
    CourseModel(
      name: "Teste Curso 5".obs,
      description: "Teste descrição".obs,
    ),
    CourseModel(
      name: "Teste Curso 6".obs,
      description: "Teste descrição".obs,
    ),
    CourseModel(
      name: "Teste Curso 7".obs,
      description: "Teste descrição".obs,
    ),
    CourseModel(
      name: "Teste Curso 8".obs,
      description: "Teste descrição".obs,
    ),
    CourseModel(
      name: "Teste Curso 9".obs,
      description: "Teste descrição".obs,
    ),
  ].obs;

  void save(CourseModel course, RxList<CourseModel> courseList) {
    if (!courseList.contains(course)) {
      courseList.add(course);
    }
  }

  void remove(CourseModel course, RxList<CourseModel> courseList) {
    courseList.remove(course);
  }

  RxList<CourseModel> findAllCourses() {
    return courses;
  }
}
