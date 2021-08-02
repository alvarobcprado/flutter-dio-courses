import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CourseModel {
  Rx<String>? name;
  Rx<String>? description;
  Rx<Image> logoImage = Image.asset("assets/imgs/course-empty.png").obs;
  CourseModel({
    this.name,
    this.description,
  });
}
