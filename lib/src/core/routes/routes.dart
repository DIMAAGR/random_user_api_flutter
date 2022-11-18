import 'package:flutter/material.dart';
import 'package:random_user_api_flutter/src/views/details/person_detail_view.dart';
import 'package:random_user_api_flutter/src/views/home/home_view.dart';

class AppRoutes {
  static const String home = '/home';
  static const String details = '/person-details';
}

Map<String, Widget Function(BuildContext)> routes = {
  AppRoutes.home: (context) => const HomeView(),
  AppRoutes.details: (context) => const PersonDetailView(),
};
