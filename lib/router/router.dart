import 'package:flutter/material.dart';
import 'package:shoes_app_ui/models/shoe_model.dart';
import 'package:shoes_app_ui/screens/homepage.dart';
import 'package:shoes_app_ui/screens/login.dart';
import 'package:shoes_app_ui/screens/shop/shoeDetails.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (context) => const LoginPage());
      case "/homepage":
        return MaterialPageRoute(builder: (context) => const HomePage());
      case "shoeDetails": 
        final Shoe selectedShoe = settings.arguments as Shoe;
        return MaterialPageRoute(builder: (context) => ShoeDetails(shoe: selectedShoe), settings: settings);

      default:
        // to change
        return MaterialPageRoute(builder: (context) => const LoginPage());
    }
  }
}
