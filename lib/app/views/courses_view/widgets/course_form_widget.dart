import 'package:flutter/material.dart';

class CourseFormWidget extends StatefulWidget {
  const CourseFormWidget({Key? key}) : super(key: key);

  @override
  _CourseFormWidgetState createState() => _CourseFormWidgetState();
}

class _CourseFormWidgetState extends State<CourseFormWidget> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [],
      ),
    );
  }
}
