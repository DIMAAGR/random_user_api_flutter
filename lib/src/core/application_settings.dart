import 'package:flutter/material.dart';
import 'package:random_user_api_flutter/src/core/routes/routes.dart' as app_routes;

class ApplicationSettings {
  static const String title = 'Random User API Flutter App';

  static final Map<String, Widget Function(BuildContext)> routes = app_routes.routes;
}
