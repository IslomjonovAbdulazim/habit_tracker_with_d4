import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habit_tracker_with_d4/models/habit_model.dart';
import 'package:habit_tracker_with_d4/pages/create_page.dart';

import '../controller/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Habits"),
        actions: [
          CupertinoButton(
            onPressed: () {
              Get.to(CreatePage());
            },
            child: Icon(CupertinoIcons.add),
          ),
        ],
      ),
    );
  }
}

class _HabitWidget extends GetView<HomeController> {
  final HabitModel habit;

  const _HabitWidget(this.habit, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
