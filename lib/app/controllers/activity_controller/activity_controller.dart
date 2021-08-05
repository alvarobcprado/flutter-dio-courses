import 'package:dio_cursos/app/models/activity_model/activity_model.dart';
import 'package:dio_cursos/app/models/course_model/course_model.dart';
import 'package:dio_cursos/app/repositories/activity_repository.dart/activity_repository.dart';
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

  // void navigateToEditCourse(CourseModel course) {
  //   Get.toNamed("/courses", arguments: course);
  // }

  // void deleteCourse(CourseModel course) {
  //   courseList.remove(course);
  // }

  // void saveCourse(CourseModel course) {
  //   courseRepo.save(course, courseList);
  // }

  // void validateForm(CourseModel course, GlobalKey<FormState> formKey) {
  //   if (formKey.currentState!.validate()) {
  //     saveCourse(course);
  //     Get.back();
  //   }
  // }

  // void updateName(CourseModel course, String name) {
  //   course.name.value = name;
  // }

  // void updateDescription(CourseModel course, String description) {
  //   course.description.value = description;
  // }

}
