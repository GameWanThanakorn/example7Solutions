import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/home_logic.dart';
import 'package:flutter_application_1/utils/bottom_sheet_widget/bottom_sheet_widget.dart';
part 'widgets/body_home_view.dart';
part 'widgets/build_index_item_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 8,
        title: const Text(
          "Example App",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 24),
        ),
      ),
      body: const BodyHomeView(),
    );
  }
}
