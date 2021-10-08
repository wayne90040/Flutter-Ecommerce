

import 'package:flutter/cupertino.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container();
          }
      ),
    );
  }
}