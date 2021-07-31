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
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: "Nome do Curso:",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              keyboardType: TextInputType.multiline,
              minLines: 6,
              maxLines: null,
              decoration: InputDecoration(
                alignLabelWithHint: true,
                labelText: "Descrição do Curso:",
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
