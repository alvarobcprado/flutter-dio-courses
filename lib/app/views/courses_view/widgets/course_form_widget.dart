import 'dart:io';

import 'package:dio_cursos/app/models/course_model/course_model.dart';
import 'package:dio_cursos/app/repositories/course_repository/course_repository.dart';
import 'package:dio_cursos/app/views/home_view/home_view.dart';
import 'package:dio_cursos/app/widgets/app_bar_widget.dart';
import 'package:dio_cursos/main.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CourseFormWidget extends StatefulWidget {
  const CourseFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  _CourseFormWidgetState createState() => _CourseFormWidgetState();
}

class _CourseFormWidgetState extends State<CourseFormWidget> {
  final _formKey = GlobalKey<FormState>();
  final CourseRepository _repository = Get.put(CourseRepository());
  final picker = ImagePicker();

  CourseModel course = CourseModel();

  void validateForm() {
    if (_formKey.currentState!.validate()) {
      _repository.save(course);
      Get.back();
    }
  }

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
                onTap: updateImage,
                child: Container(
                  height: 200,
                  width: 200,
                  child: Obx(() => course.logoImage.value),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              initialValue: course.name?.value,
              onChanged: updateName,
              validator: RequiredValidator(errorText: "Campo obrigatório"),
              maxLength: 100,
              decoration: InputDecoration(
                labelText: "Nome do Curso:",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              initialValue: course.description?.value,
              validator: RequiredValidator(errorText: "Campo obrigatório"),
              keyboardType: TextInputType.multiline,
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
              onPressed: validateForm,
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

  void updateImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      course.logoImage.value = Image.file(
        File(pickedFile.path),
      );
    }
  }

  void updateName(name) {
    course.name?.value = name;
  }

  void updateDescription(description) {
    course.name?.value = description;
  }
}
