import 'package:dio_cursos/app/models/course_model/course_model.dart';
import 'package:get/get.dart';

class CourseController extends GetxController {
  CourseModel course = CourseModel();

  @override
  void onInit() {
    course.name = "Teste Curso".obs;
    course.description = "Testando esse Cursão".obs;
    super.onInit();
  }
}
