import 'package:flutter/material.dart';
import 'package:random_user_api_flutter/src/views/home/home_view.dart';

class AppRoutes {
  static const String home = '/home';
}

Map<String, Widget Function(BuildContext)> routes = {
  AppRoutes.home: (context) => const HomeView(),
};
