import 'package:flutter/material.dart';

import 'package:quego_6/service/Auth.dart';

import 'package:quego_6/screen/LoginMobileNumber.dart';
import 'package:quego_6/screen/Home.dart';

Auth authService = new Auth();

void main() async {
  Widget defaultscreen = new LoginMobileNumber();

  // AUTH
  bool authresult = await authService.login();
  //LOGIKA
  if (authresult) {
    defaultscreen = new Home();
  }

  // RUN APP
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Quego App',
    home: defaultscreen,
    // routes: <String, WidgetBuilder>{
    //   // Set routes for using the Navigator.
    //   '/home': (BuildContext context) => new Home(),
    //   '/loginmobilenumber': (BuildContext context) => new LoginMobileNumber()
    // },
  ));
}
