import 'package:dio_cursos/app/models/course_model/course_model.dart';
import 'package:dio_cursos/app/repositories/course_repository/course_repository.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';

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
        child: Column(
          children: [
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
              child: Text("Salvar"),
              style: TextButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                primary: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void updateName(name) {
    course.name?.value = name;
  }

  void updateDescription(description) {
    course.name?.value = description;
  }
}
