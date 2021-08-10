import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CourseModel {
  late int id;
  Rx<String> name;
  Rx<String> description;
  Rx<String> link;
  Rx<String> imagePath;
  Rx<Image> logoImage;

  CourseModel({
    required this.name,
    required this.description,
    String? courseLink,
    String? imagePathString,
    Image? image,
  })  : logoImage =
            image?.obs ?? Image.asset("assets/imgs/course-empty.png").obs,
        link = courseLink?.obs ?? ''.obs,
        imagePath = imagePathString?.obs ?? ''.obs;

  CourseModel.fromDb(Map<dynamic, dynamic> map)
      : id = map['id'],
        name = map['nome'].toString().obs,
        description = map['descricao'].toString().obs,
        link = map['link'].toString().obs,
        imagePath = map['imagePath'].toString().obs,
        logoImage = map['imagePath'] != null && map['imagePath'] != ''
            ? Image.file(File(map['imagePath'])).obs
            : Image.asset("assets/imgs/course-empty.png").obs;

  Map<String, dynamic> toMap() {
    return {
      'nome': name.value,
      'descricao': description.value,
      'link': link.value,
      'imagePath': imagePath.value,
    };
  }
}
