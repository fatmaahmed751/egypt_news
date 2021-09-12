import 'package:egypt_news/presentation/routing/app_router.dart';
import 'package:egypt_news/data/remote/dio_helper.dart';
import 'package:egypt_news/presentation/screens/home_screen.dart';
import 'package:egypt_news/presentation/themes/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
