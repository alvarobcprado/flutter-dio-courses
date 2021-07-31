import 'package:flutter/material.dart';

class BackgroundBoxDecoration {
  static getBoxDecoration() {
    return BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Colors.black87,
          Colors.red.shade700,
          Colors.orange.shade700,
          Colors.yellow.shade700,
        ],
        begin: const FractionalOffset(0, 0),
        end: const FractionalOffset(1, 1),
        stops: [0, 0.4, 0.8, 1.0],
        tileMode: TileMode.clamp,
      ),
    );
  }
}
