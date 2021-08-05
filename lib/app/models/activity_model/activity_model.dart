import 'package:get/get.dart';

import '../course_model/course_model.dart';

class ActivityModel {
  final RxString name;
  RxBool checked;
  final CourseModel course;
  late RxBool check;

  ActivityModel({
    required this.name,
    check,
    required this.course,
  }) : checked = check ?? false.obs;
}
