import 'package:dio_cursos/app/controllers/course_controller/course_controller.dart';
import 'package:dio_cursos/app/models/course_model/course_model.dart';
import 'package:dio_cursos/app/widgets/app_bar_widget.dart';
import 'package:dio_cursos/app/widgets/background_box_decoration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/courses_listing_widget.dart';

class HomeView extends StatelessWidget {
  final courseCtrl = Get.put<CourseController>(CourseController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height,
        decoration: BackgroundBoxDecoration.getBoxDecoration(),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SafeArea(
                child: AppBarWidget(),
              ),
              Expanded(child: CoursesListingWidget()),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextButton(
                  onPressed: () {
                    Get.toNamed("/courses", arguments: {
                      'courseForm':
                          CourseModel(name: "".obs, description: "".obs)
                    });
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.all(10),
                    backgroundColor: Colors.black54,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    "Adicionar novo curso",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
