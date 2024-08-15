import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:store_demo_app/navigation/routes_key.dart';
import 'package:store_demo_app/service/network/network.dart';
import 'package:store_demo_app/service/network/network_string.dart';
import 'package:store_demo_app/utils/prefrences/prefrences.dart';
import 'package:store_demo_app/utils/prefrences/prefrences_key.dart';
import 'package:store_demo_app/widgets/toast.dart';

class SignUpRepo {
  Future signUp(String username, String email, String password, context) async {
    try {
      var signUp = await NetworkAPICall()
          .post(context: context, url: ApiKey.signup, body: {
        "username": username,
        "email": email,
        "password": password,
      });
      log('SignUp:- $signUp');
      if (signUp == false) {
      } else {
        var data = jsonDecode(signUp);
        String authToken = data["token"];
        log(authToken);
        AppPreference().setString(PreferencesKey.authToken, authToken);
        Navigator.pushNamed(context, Routes.homeScreen);
      }
    } catch (e) {
      log(e.toString());
      showToast("No Internet Connectivity");
      throw Exception('Failed to sign up');
    }
  }
}
