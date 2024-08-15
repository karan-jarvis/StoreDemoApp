import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:store_demo_app/screens/login/login_screen.dart';
import 'package:store_demo_app/screens/no_internet/no_internet_screen.dart';
import 'package:store_demo_app/utils/check_Internet.dart';
import 'package:store_demo_app/utils/config/config.dart';
import 'package:store_demo_app/utils/log_utils/log_util.dart';
import 'package:store_demo_app/utils/prefrences/prefrences.dart';
import 'package:store_demo_app/utils/prefrences/prefrences_key.dart';
import 'package:store_demo_app/widgets/toast.dart';

class NetworkAPICall {
  static final NetworkAPICall _networkAPICall = NetworkAPICall._internal();

  factory NetworkAPICall() {
    return _networkAPICall;
  }

  NetworkAPICall._internal();

  Future<dynamic> post({
    required String url,
    required Map<String, dynamic> body,
    required context,
  }) async {
    bool isNetwork = await hasNetwork();
    if (isNetwork) {
      var client = http.Client();
      try {
        String fullURL = AppConfig.baseUrl + url;

        Log.show(message: fullURL, tag: 'API Url');
        Log.show(message: body.toString(), tag: 'API Body');

        var uri = Uri.parse(fullURL);

        var response = await client.post(
          uri,
          body: json.encode(body),
          headers: {
            'Content-Type': 'application/json',
          },
        );
        print("Responce :- $response");
        var jsonData = response.body;
        log(jsonData);

        if (response.statusCode == 200) {
          return jsonData;
        } else if (response.statusCode == 401) {
          if (jsonData == "username or password is incorrect") {
            showToast(
                "The username and password you entered is invalid. Please double-check and try again.");
          } else {
            showToast("UnAuthorised user please do login again");
            await AppPreference().clearSharedPreferences();
            Navigator.of(context).push(
              PageRouteBuilder(
                opaque: false,
                pageBuilder: (_, __, ___) => LoginScreen(),
                transitionsBuilder: (_, anim, __, child) {
                  return FadeTransition(
                    opacity: anim,
                    child: ScaleTransition(
                      scale: Tween<double>(begin: 0.8, end: 1.0).animate(anim),
                      child: child,
                    ),
                  );
                },
              ),
            );
          }
          return false;
        } else if (response.statusCode == 400) {
          return false;
        }
      } catch (exception) {
        client.close();
      }
    } else {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const NoInternetScreen()));
    }
  }

  Future<dynamic> get({required String url, required context}) async {
    bool isNetwork = await hasNetwork();
    if (isNetwork) {
      final client = http.Client();
      try {
        late String fullURL = AppConfig.baseUrl + url;

        Log.show(message: fullURL, tag: 'API Url');

        var uri = Uri.parse(fullURL);
        var response = await client.get(uri, headers: {
          'Content-Type': 'application/json',
        });

        Log.show(
            message: response.statusCode.toString(),
            tag: 'Response statusCode');

        var jsonData = json.decode(response.body);
        print(jsonData);
        if (response.statusCode == 200) {
          return jsonData;
        } else if (response.statusCode == 401) {
          showToast("UnAuthorised User Login Again");
          await AppPreference().clearSharedPreferences();
          Navigator.of(context).push(
            PageRouteBuilder(
              opaque: false,
              pageBuilder: (_, __, ___) => LoginScreen(),
              transitionsBuilder: (_, anim, __, child) {
                return FadeTransition(
                  opacity: anim,
                  child: ScaleTransition(
                    scale: Tween<double>(begin: 0.8, end: 1.0).animate(anim),
                    child: child,
                  ),
                );
              },
            ),
          );
        } else {
          showToast(jsonData);
          return false;
        }
      } catch (exception) {
        client.close();
        log("Error");
      }
    } else {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const NoInternetScreen()));
    }
  }

  Future<dynamic> put({required String url, required body}) async {
    var client = http.Client();
    try {
      String fullURL = AppConfig.baseUrl + url;

      Log.show(message: fullURL, tag: 'API Url');
      Log.show(message: body.toString(), tag: 'API Body');

      var uri = Uri.parse(fullURL);

      var response = await client.put(
        uri,
        body: json.encode(body),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${AppConfig.barrierToken}'
        },
      );
      var jsonData = jsonDecode(response.body);
      log(jsonData);

      if (response.statusCode == 200) {
        return jsonData;
      } else {
        showToast("${jsonData["error"]["message"]}");
        return false;
      }
    } catch (exception) {
      client.close();
    }
  }
}

class ErrorResp {
  bool isSuccess;
  Map resp;

  ErrorResp({required this.isSuccess, required this.resp});
}
