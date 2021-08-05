import 'package:get/get.dart';

import '../course_model/course_model.dart';

class ActivityModel {
  final RxString name;
  RxBool checked = false.obs;
  final CourseModel course;

  ActivityModel({
    required this.name,
    required this.checked,
    required this.course,
  });
}
