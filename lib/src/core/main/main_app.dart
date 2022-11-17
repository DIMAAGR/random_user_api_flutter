import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:random_user_api_flutter/src/core/application_settings.dart';
import 'package:random_user_api_flutter/src/core/theme/theme.dart';
import 'package:random_user_api_flutter/src/views/home/home_view.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeView(),
      title: ApplicationSettings.title,
      routes: ApplicationSettings.routes,
      theme: AppTheme.lightAppTheme,
      themeMode: ThemeMode.light,
    );
  }
}
