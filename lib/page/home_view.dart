import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/home_logic.dart';
part 'widgets/body_home_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 8,
        title: const Text("Example App"),
      ),
      body: const BodyHomeView(),
    );
  }
}
