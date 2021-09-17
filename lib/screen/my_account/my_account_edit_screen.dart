
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/viewmodels/my_account_view_model.dart';
import 'package:provider/provider.dart';

class MyAccountEditScreen extends StatelessWidget {
  static String routeName = "/my_account_edit";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var viewModel = Provider.of<MyAccountViewModel>(context);

    return ChangeNotifierProvider(
      create: (BuildContext con) {
        return MyAccountViewModel();
      },
      child: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Text("Edit"),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Container(
              height: 50,
              color: Colors.white,
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(15, 15, 5, 5),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(0)
                    ),
                    borderSide: BorderSide(
                        color: Colors.black
                    )
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(0)
                    ),
                    borderSide: BorderSide(
                        color: Colors.black
                    )
                  ),
                )
              ),
            )
          ),
        ),
      ),
    );
  }
}