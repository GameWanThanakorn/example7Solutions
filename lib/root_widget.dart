import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/home_view.dart';

class MyApp extends MaterialApp {
  MyApp({super.key})
      : super(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const HomeView(),
        );
}
