import 'dart:async';
import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';

class Auth {
  bool authdefault = false;

  // Login
  Future<bool> login() async {
    // LOCAL
    final prefs = await SharedPreferences.getInstance();
    final key = 'token_local';
    final value = prefs.getString(key) ?? null;

    // LOGIC
    if (value != null) {
      authdefault = true;
    }

    print("Dari Future login auth : ${authdefault} dan datanya = ${value}");
    // Simulate a future for response after 2 second.
    return await new Future<bool>.delayed(
        new Duration(seconds: 2), () => authdefault);
  }

  // Logout
  Future<void> logout() async {
    // Simulate a future for response after 1 second.
    return await new Future<void>.delayed(new Duration(seconds: 1));
  }
}
