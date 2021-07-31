import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Image.asset(
          'assets/imgs/logo.png',
          key: Key("logo_image_key"),
          scale: 1.5,
        ),
      ),
    );
  }
}
