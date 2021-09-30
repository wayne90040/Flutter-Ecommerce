

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/screen/help_center/problem_widget.dart';
import 'package:flutter_ecommerce/viewmodels/help_center_view_model.dart';
import 'package:provider/provider.dart';


class HelpCenterScreen extends StatelessWidget {

  static String routeName = "/help_center";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return HelpCenterViewModel();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Help Center")
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                ProblemWidget(),

                SizedBox(
                    height: 50,
                    child: Align(
                      child: Text("分類"),
                    )
                ),

                Divider(color: Colors.grey,),

                SizedBox(
                    height: 50,
                    child: Align(
                      child: Text("聯絡我們"),
                    )
                ),
              ],
            ),
          )
        )
      ),
    );
  }

  Widget _buildItem(String title) {
    return SizedBox(
      height: 50,

      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          // Go to WebView

          print(title);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(title),
            ),
            Spacer(),
            Divider(color: Colors.grey,)
          ],
        ),
      ),
    );
  }
}