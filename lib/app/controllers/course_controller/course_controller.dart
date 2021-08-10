import 'dart:io';

import 'package:dio_cursos/app/models/course_model/course_model.dart';
import 'package:dio_cursos/app/repositories/course_repository/course_repository.dart';
import 'package:dio_cursos/app/views/course_webview/course_webview.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CourseController extends GetxController {
  final CourseRepository courseRepo = CourseRepository();
  RxList<CourseModel> courseList = <CourseModel>[].obs;

  @override
  void onInit() async {
    courseList = await courseRepo.findAllCourses();
    super.onInit();
  }

  void navigateToEditCourse(CourseModel course) {
    Get.toNamed("/courses", arguments: {'courseForm': course});
  }

  void deleteCourse(CourseModel course) {
    // courseList.remove(course);
    courseRepo.remove(course, courseList);
  }

  void saveCourse(CourseModel course) {
    courseRepo.save(course, courseList);
  }

  void validateForm(CourseModel course, GlobalKey<FormState> formKey) {
    if (formKey.currentState!.validate()) {
      saveCourse(course);
      Get.back();
    }
  }

  void updateName(CourseModel course, String name) {
    course.name.value = name;
  }

  void updateDescription(CourseModel course, String description) {
    course.description.value = description;
  }

  void updateImage(CourseModel course, ImagePicker picker) async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      course.imagePath.value = pickedFile.path;
      course.logoImage.value = Image.file(
        File(pickedFile.path),
      );
    }
  }

  updateLink(CourseModel course, String link) {
    course.link.value = link;
  }

  navigateToCourseWebView(String? value) {
    if (value != null) {
      Get.to(
        CourseWebView(url: value),
      );
    }
  }
}
