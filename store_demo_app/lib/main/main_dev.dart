import 'package:flutter/material.dart';
import 'package:store_demo_app/main/main.dart';
import 'package:store_demo_app/utils/config/config.dart';
import 'package:store_demo_app/utils/prefrences/prefrences.dart';

Future<void> main() async {
  AppConfig.setupEnv(Environment.dev);
  WidgetsFlutterBinding.ensureInitialized();
  await AppPreference().initialAppPreference();
  runApp(const AppEntryPoint());
}
