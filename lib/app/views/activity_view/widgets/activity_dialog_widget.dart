import 'package:dio_cursos/app/models/activity_model/activity_model.dart';
import 'package:dio_cursos/app/views/activity_form_view/activity_form_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActivityDialogWidget {
  ActivityDialogWidget.showDialog({required ActivityModel activity}) {
    showActivityDialog(activity: activity);
  }

  showActivityDialog({required ActivityModel activity}) {
    return Get.defaultDialog(
      title:
          activity.name.value.isEmpty ? "Nova Atividade" : "Editar Atividade",
      titleStyle: TextStyle(fontSize: 25, color: Colors.red),
      content: Container(
        height: 200,
        padding: const EdgeInsets.all(8.0),
        child: ActivityFormView(
          activity: activity,
        ),
      ),
    );
  }
}
