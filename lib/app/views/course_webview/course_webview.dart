import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CourseWebView extends StatelessWidget {
  final String url;
  const CourseWebView({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: url,
      ),
    );
  }
}
