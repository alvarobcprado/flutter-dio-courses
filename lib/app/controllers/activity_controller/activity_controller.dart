import 'package:dio_cursos/app/models/activity_model/activity_model.dart';
import 'package:dio_cursos/app/models/course_model/course_model.dart';
import 'package:dio_cursos/app/repositories/activity_repository.dart/activity_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActivityController extends GetxController {
  final _repo = ActivityRepository();

  void deleteActivity(ActivityModel activity) {
    _repo.deleteActivity(activity);
  }

  void saveActivity(ActivityModel activity) {
    _repo.saveActivity(activity);
  }

  RxList<ActivityModel> findAllActivitiesByCourse(CourseModel course) {
    return _repo.findAllActivityByCourse(course);
  }

  void navigateToActivitiesListing(CourseModel course) {
    Get.toNamed("/activities", arguments: {'actView': course});
  }

  // void deleteCourse(CourseModel course) {
  //   courseList.remove(course);
  // }

  // void saveCourse(CourseModel course) {
  //   courseRepo.save(course, courseList);
  // }

  void validateForm(ActivityModel activity, GlobalKey<FormState> formKey) {
    if (formKey.currentState!.validate()) {
      saveActivity(activity);
      Get.back();
    }
  }

  void updateName(ActivityModel activity, String name) {
    activity.name.value = name;
  }

  // void updateDescription(CourseModel course, String description) {
  //   course.description.value = description;
  // }

}
