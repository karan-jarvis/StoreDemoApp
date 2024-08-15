import 'package:flutter/material.dart';
import 'package:store_demo_app/navigation/route_generator.dart';
import 'package:store_demo_app/navigation/routes_key.dart';
import 'package:store_demo_app/utils/prefrences/prefrences.dart';
import 'package:store_demo_app/utils/prefrences/prefrences_key.dart';

class AppEntryPoint extends StatefulWidget {
  const AppEntryPoint({Key? key}) : super(key: key);

  @override
  State<AppEntryPoint> createState() => _AppEntryPointState();
}

class _AppEntryPointState extends State<AppEntryPoint> {
  bool isLogin = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLogin = AppPreference().getBool(PreferencesKey.isLogin);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StoreListing',
      initialRoute: isLogin ? Routes.homeScreen : Routes.login,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
