import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/home_view.dart';
import 'package:flutter_application_1/utils/app_constants.dart';

class MyApp extends MaterialApp {
  MyApp({
    super.key,
  }) : super(
          title: 'Flutter Demo',
          navigatorKey: AppConstants.parentNavigatorKey,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const HomeView(),
        );
}
