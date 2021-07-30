import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dio Cursos"),
        actions: [
          IconButton(
            onPressed: () => Get.toNamed("/courses"),
            icon: Icon(Icons.plus_one),
          ),
        ],
      ),
    );
  }
}
