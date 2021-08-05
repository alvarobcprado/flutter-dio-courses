import 'package:flutter/material.dart';
import 'package:dio_cursos/app/models/activity_model/activity_model.dart';

import 'widgets/activity_form_widget.dart';

class ActivityFormView extends StatelessWidget {
  final ActivityModel activity;
  const ActivityFormView({
    Key? key,
    required this.activity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ActivityFormWidget(activity: this.activity);
  }
}
