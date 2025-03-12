import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habit_tracker_with_d4/models/habit_model.dart';

import '../controller/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold();
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
