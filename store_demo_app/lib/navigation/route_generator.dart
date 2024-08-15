import 'package:flutter/material.dart';
import 'package:store_demo_app/navigation/routes_key.dart';
import 'package:store_demo_app/screens/home_screen/home_screen.dart';
import 'package:store_demo_app/screens/home_screen/product_model.dart';
import 'package:store_demo_app/screens/login/login_screen.dart';
import 'package:store_demo_app/screens/product_detail/product_details_screen.dart';
import 'package:store_demo_app/screens/profile/profile_screen.dart';
import 'package:store_demo_app/screens/profile/user_data.dart';
import 'package:store_demo_app/screens/signup/signup_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case Routes.signup:
        return MaterialPageRoute(builder: (context) => const SignUpScreen());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case Routes.productDetailScreen:
        return MaterialPageRoute(
            builder: (context) =>
                ProductDetailScreen(product: args as ProductModel));
      case Routes.profileScreen:
        return MaterialPageRoute(
            builder: (context) =>
                ProfileScreen(userDetails: args as UserDetails));
      case Routes.editProfile:
        return MaterialPageRoute(
            builder: (context) =>
                EditProfileScreen(userDetails: args as UserDetails));
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (context) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text("Error"),
          ),
          body: const Center(
            child: Text("Page not found!"),
          ),
        );
      },
    );
  }
}
