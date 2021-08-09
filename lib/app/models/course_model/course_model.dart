import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CourseModel {
  Rx<String> name;
  Rx<String> description;
  Rx<String> link;
  Rx<Image> logoImage;

  CourseModel({
    required this.name,
    required this.description,
    String? courseLink,
    Image? image,
  })  : logoImage =
            image?.obs ?? Image.asset("assets/imgs/course-empty.png").obs,
        link = courseLink?.obs ?? ''.obs;
}
