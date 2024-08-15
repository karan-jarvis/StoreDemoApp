import 'package:flutter/material.dart';
import 'package:store_demo_app/utils/prefrences/prefrences.dart';

import '../utils/config/config.dart';
import 'main.dart';

Future<void> main() async {
  AppConfig.setupEnv(Environment.prod);
  WidgetsFlutterBinding.ensureInitialized();
  await AppPreference().initialAppPreference();
  runApp(const AppEntryPoint());
}