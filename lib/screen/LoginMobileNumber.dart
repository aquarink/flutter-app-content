import 'package:flutter/material.dart';

import 'package:quego_6/palette/ColorPalette.dart';

import 'package:quego_6/screen/LoginOtp.dart';

import 'package:back_button_interceptor/back_button_interceptor.dart';

class LoginMobileNumber extends StatefulWidget {
  @override
  _LoginMobileNumberState createState() => _LoginMobileNumberState();
}

class _LoginMobileNumberState extends State<LoginMobileNumber> {
  TextEditingController textEditingController = new TextEditingController();

  String mobilenumber = "";

  registerAction() {
    setState(() {
      mobilenumber = textEditingController.text;

      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginOtp(
              mn: mobilenumber,
            ),
          ));
    });
  }

  @override
  void initState() {
    super.initState();
    // INIT
    BackButtonInterceptor.add(myInterceptor);
  }

  // BACK INTERCEP
  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }

  bool myInterceptor(bool stopDefaultButtonEvent) {
    print("BACK BUTTON! Pressseeedd");
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ColorPalette.primaryColor,
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  _iconLogin(),
                  _titleDescription(),
                  _textField(),
                  _buildButton(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _iconLogin() {
    return Image.asset(
      "assets/images/icon_register.png",
      width: 150.0,
      height: 150.0,
    );
  }

  Widget _titleDescription() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 16.0),
        ),
        Text(
          "Register Mobile Number",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 12.0),
        ),
        Text(
          "Input your mobile number to verify your account.",
          style: TextStyle(
            fontSize: 12.0,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _textField() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 12.0),
        ),
        Center(
          child: TextFormField(
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: ColorPalette.underlineTextField,
                  width: 1.5,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 3.0,
                ),
              ),
              hintText: "Mobile Number",
              hintStyle: TextStyle(color: ColorPalette.hintColor),
            ),
            style: TextStyle(color: Colors.white),
            autofocus: false,
            controller: textEditingController,
            keyboardType: TextInputType.phone,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 12.0),
        ),
      ],
    );
  }

  Widget _buildButton(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 16.0),
        ),
        InkWell(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            width: double.infinity,
            child: Text(
              'Register',
              style: TextStyle(color: ColorPalette.primaryColor),
              textAlign: TextAlign.center,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          onTap: registerAction,
        ),
      ],
    );
  }
}
