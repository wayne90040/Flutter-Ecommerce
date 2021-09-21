

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecommerce/enums.dart';
import 'package:flutter_ecommerce/screen/my_account_edit/my_account_edit_screen.dart';
import 'package:flutter_ecommerce/viewmodels/my_account_view_model.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  late String nameChange = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<MyAccountViewModel>(context, listen: false).getMyAccountInfoInFirebase();
  }

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<MyAccountViewModel>(context);

    // TODO: implement build
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 250,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // TODO: Background Image
                Container(
                    decoration: BoxDecoration(
                        color: Colors.black
                    )
                ),

                // TODO: Profile Image
                SizedBox(
                  width: 100,
                  height: 100,
                  child: CircleAvatar(
                    backgroundImage: (viewModel.myAccount?.profileImage ?? "").isNotEmpty ?
                      NetworkImage(viewModel.myAccount?.profileImage ?? "") : AssetImage("assets/images/Profile Image.png") as ImageProvider
                  )
                ),

                // TODO: Edit Profile Icon
                Positioned(
                  left:  MediaQuery.of(context).size.width/2 + 20 ,
                  top: 140,
                  child: SizedBox(
                    width: 40,
                    height: 40,
                    child: FlatButton(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(45),
                        side: BorderSide(color: Colors.white)
                      ),
                      color: Color(0xfff5f6f9),
                      child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
                      onPressed: () {
                        print("change profile image");
                      },
                    ),
                  )
                )
              ],
            ),
          ),

          MyAccountCell(
            title: "名稱",
            value: viewModel.myAccount?.name ?? "",
            didTapped: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>
                      MyAccountEditScreen(() => viewModel.getMyAccountInfoInFirebase(),
                        type: AccountEditType.name,
                      ),
                  )
              );
            }
          ),

          MyAccountCell(
            title: "使用者帳號",
            value: viewModel.myAccount?.account ?? "",
            didTapped: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>
                      MyAccountEditScreen(() => viewModel.getMyAccountInfoInFirebase(),
                        type: AccountEditType.userAccount,
                      ),
                  )
              );
            }
          ),

          MyAccountCell(
            title: "簡介",
            value: viewModel.myAccount?.introduction ?? "",
            didTapped: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>
                      MyAccountEditScreen(() => viewModel.getMyAccountInfoInFirebase(),
                        type: AccountEditType.introduction,
                      ),
                  )
              );
            }
          ),

          Container(
            height: 15,
            decoration: BoxDecoration(
              color: Colors.grey
            ),
          ),

          MyAccountCell(
            title: "性別",
            value: viewModel.myAccount?.gender ?? "",
            didTapped: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>
                      MyAccountEditScreen(() => viewModel.getMyAccountInfoInFirebase(),
                        type: AccountEditType.gender,
                      ),
                  )
              );
            }
          ),

          MyAccountCell(
            title: "生日",
            value: viewModel.myAccount?.birthday ?? "",
            didTapped: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>
                      MyAccountEditScreen(() => viewModel.getMyAccountInfoInFirebase(),
                        type: AccountEditType.birthday,
                      ),
                  )
              );
            }
          ),

          MyAccountCell(
            title: "手機號碼",
            value: viewModel.myAccount?.phone ?? "",
            didTapped: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>
                      MyAccountEditScreen(() => viewModel.getMyAccountInfoInFirebase(),
                        type: AccountEditType.cellphone,
                      ),
                  )
              );
            }
          ),

          MyAccountCell(
            title: "email",
            value: viewModel.myAccount?.email ?? "",
            didTapped: () {

            }
          ),

          Container(
            height: 15,
            decoration: BoxDecoration(
                color: Colors.grey
            ),
          ),

          MyAccountCell(
            title: "密碼變更",
            value: "",
            didTapped: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>
                      MyAccountEditScreen(() => viewModel.getMyAccountInfoInFirebase(),
                        type: AccountEditType.password,
                      ),
                  )
              );
            }
          ),
        ]
      ),
    );
  }
}

class MyAccountCell extends StatelessWidget {
  const MyAccountCell({
    Key? key,
    required this.title,
    required this.value,
    required this.didTapped,
  }) : super(key: key);

  final String title;
  final String value;
  final GestureTapCallback didTapped;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GestureDetector(
        onTap: didTapped,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 14
                ),
              ),
              Spacer(),
              Text(
                value,
                style: TextStyle(
                  fontSize: 14
                ),
              ),
              SizedBox(width: 10),
              Icon(
                Icons.arrow_forward_ios,
                size: 15,
              )
            ],
          ),
        ),
      ),
    );
  }
}