import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CourseModel {
  Rx<String> name;
  Rx<String> description;
  Rx<Image> logoImage;
  CourseModel({
    required this.name,
    required this.description,
    Image? image,
  }) : logoImage =
            image?.obs ?? Image.asset("assets/imgs/course-empty.png").obs;
}
