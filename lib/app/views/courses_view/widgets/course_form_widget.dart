import 'dart:io';

import 'package:dio_cursos/app/controllers/course_controller/course_controller.dart';
import 'package:dio_cursos/app/models/course_model/course_model.dart';
import 'package:dio_cursos/main.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CourseFormWidget extends StatelessWidget {
  final CourseModel course;
  CourseFormWidget({Key? key, required this.course}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final courseCtrl = Get.find<CourseController>();
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Visibility(
              child: GestureDetector(
                onTap: () => courseCtrl.updateImage(course, picker),
                child: Container(
                  height: 200,
                  width: 200,
                  child: Obx(() => course.logoImage.value),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              initialValue: course.name.value,
              onChanged: (name) => courseCtrl.updateName(course, name),
              validator: RequiredValidator(errorText: "Campo obrigatório"),
              maxLength: 100,
              decoration: InputDecoration(
                labelText: "Nome do Curso:",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              initialValue: course.description.value,
              validator: RequiredValidator(errorText: "Campo obrigatório"),
              onChanged: (description) =>
                  courseCtrl.updateDescription(course, description),
              minLines: 6,
              maxLines: null,
              maxLength: 1000,
              decoration: InputDecoration(
                alignLabelWithHint: true,
                labelText: "Descrição do Curso:",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 24),
            TextButton(
              onPressed: () => courseCtrl.validateForm(course, _formKey),
              style: TextButton.styleFrom(
                padding: EdgeInsets.all(10),
                backgroundColor: MyApp.color[400],
                primary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.save),
                  SizedBox(width: 5),
                  Text(
                    "Salvar",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
