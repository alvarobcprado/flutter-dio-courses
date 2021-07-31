import 'package:dio_cursos/app/widgets/app_bar_widget.dart';
import 'package:dio_cursos/app/widgets/background_box_decoration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BackgroundBoxDecoration.getBoxDecoration(),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppBarWidget(),
              Container(),
              TextButton(
                onPressed: () {
                  Get.toNamed("/courses");
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
            ],
          ),
        ),
      ),
    );
  }
}
