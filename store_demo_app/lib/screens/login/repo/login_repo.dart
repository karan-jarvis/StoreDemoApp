import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:store_demo_app/navigation/route_generator.dart';
import 'package:store_demo_app/navigation/routes_key.dart';
import 'package:store_demo_app/service/network/network.dart';
import 'package:store_demo_app/service/network/network_string.dart';
import 'package:store_demo_app/utils/prefrences/prefrences.dart';
import 'package:store_demo_app/utils/prefrences/prefrences_key.dart';
import 'package:store_demo_app/widgets/toast.dart';

class LoginRepo {
  Future login(String username, String password, context) async {
    try {
      var login = await NetworkAPICall().post(
          context: context,
          url: ApiKey.login,
          body: {"username": username, "password": password});
      log('Login:- $login');
      if (login == false) {
      } else {
        var data = jsonDecode(login);
        String authToken = data["token"];
        log(authToken);
        AppPreference().setString(PreferencesKey.authToken, authToken);
        AppPreference().setString(PreferencesKey.userName, username);
        AppPreference().setBool(PreferencesKey.isLogin, true);
        Navigator.pushNamed(context, Routes.homeScreen);
      }
    } catch (e) {
      log(e.toString());
      showToast("No Internet Connectivity");
      throw Exception('Failed to load');
    }
  }
}
