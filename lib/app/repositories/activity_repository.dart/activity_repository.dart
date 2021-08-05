import 'package:dio_cursos/app/models/activity_model/activity_model.dart';
import 'package:dio_cursos/app/models/course_model/course_model.dart';
import 'package:get/get.dart';

class ActivityRepository {
  var activities = <ActivityModel>[].obs;
  void saveActivity(ActivityModel activity) {
    if (!activities.contains(activity)) {
      activities.add(activity);
    }
  }

  void deleteActivity(ActivityModel activity) {
    activities.remove(activity);
  }

  RxList<ActivityModel> findAllActivityByCourse(CourseModel course) {
    return activities;
  }
}
