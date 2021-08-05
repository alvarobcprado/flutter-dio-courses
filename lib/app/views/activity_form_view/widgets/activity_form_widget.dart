import 'package:dio_cursos/app/controllers/activity_controller/activity_controller.dart';
import 'package:dio_cursos/app/models/activity_model/activity_model.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../main.dart';

class ActivityFormWidget extends StatelessWidget {
  final ActivityModel activity;
  ActivityFormWidget({Key? key, required this.activity}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final activityCtrl = Get.find<ActivityController>();
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Wrap(
          alignment: WrapAlignment.end,
          spacing: 20,
          runSpacing: 10,
          children: [
            TextFormField(
              initialValue: activity.name.value,
              onChanged: (name) => activityCtrl.updateName(activity, name),
              validator: RequiredValidator(errorText: "Campo obrigatório"),
              maxLength: 100,
              decoration: InputDecoration(
                labelText: "Nome da atividade:",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 24),
            TextButton(
              onPressed: () => activityCtrl.validateForm(activity, _formKey),
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
