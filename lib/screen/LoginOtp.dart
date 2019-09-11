import 'package:flutter/material.dart';

import 'package:quego_6/palette/ColorPalette.dart';
import 'package:quego_6/MainScreen.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';

class LoginOtp extends StatefulWidget {
  final String mn;
  const LoginOtp({Key key, this.mn}) : super(key: key);

  @override
  _LoginOtpState createState() => _LoginOtpState();
}

class _LoginOtpState extends State<LoginOtp> {
  // Controller
  TextEditingController textEditingController = new TextEditingController();

  String tokennya;

  // LOCAL
  _read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token_local';
    final value = prefs.getString(key) ?? null;
    print('read at OTP ::::::::::::: $value');

    //STATE
    setState(() {
      tokennya = value;
    });
  }

  _save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token_local';
    final value = token;
    prefs.setString(key, value);
    print('saved $value');
  }

  // Initialize
  String mobilenumber = "";
  String otp = "";

  @override
  void initState() {
    super.initState();

    // LOCAL
    _read();

    // INIT
    BackButtonInterceptor.add(myInterceptor);

    //STATE
    setState(() {
      mobilenumber = widget.mn;
    });
  }

  // BACK INTERCEP
  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }

  bool myInterceptor(bool stopDefaultButtonEvent) {
    print("BACK BUTTON!");
    return true;
  }

  otpAction() {
    setState(() {
      otp = textEditingController.text;
      print(mobilenumber);
      print(otp);

      _save("tkn-1234567890");

      print("Sukses add local DB");

      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MainScreen(),
          ));
    });
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
      "assets/images/icon_otp.png",
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
          "Input OTP",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 12.0),
        ),
        Text(
          "Input your one time password you have from sms.",
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
              hintText: "OTP",
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
              'Verify',
              style: TextStyle(color: ColorPalette.primaryColor),
              textAlign: TextAlign.center,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          onTap: otpAction,
        ),
      ],
    );
  }
}
