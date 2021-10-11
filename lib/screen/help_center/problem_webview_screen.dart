

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/models/help_center_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ProblemWebViewScreen extends StatelessWidget {

  static String routeName = "/problem_web_view";

  @override
  Widget build(BuildContext context) {

    /* 獲取上頁面回傳的參數 */
    HelpCenter? _model = ModalRoute.of(context)?.settings.arguments as HelpCenter;

    return Scaffold(
      appBar: AppBar(
        title: Text(_model.title),
      ),
      body: Container(
        child: WebView(
          // URL
          initialUrl: _model.clickThrough,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}