import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  final Widget? image;
  final String? title;

  const AppBarWidget({Key? key, this.image, this.title}) : super(key: key);

  Image getImage() {
    return Image.asset(
      "assets/imgs/logo.png",
      key: Key("logo_img_key"),
      scale: 1.5,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          image ?? getImage(),
          Visibility(
            visible: this.title != null,
            child: Flexible(
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  this.title ?? "",
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
