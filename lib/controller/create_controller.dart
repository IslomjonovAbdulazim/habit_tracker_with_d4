import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../models/habit_model.dart';

class CreateController extends GetxController {
  HabitModel? habit;
  TextEditingController nameController = TextEditingController();
  FocusNode focus = FocusNode();

  @override
  void onInit() {
    nameController.text = habit?.title ?? "";
    super.onInit();
  }

  void create() async {
    HabitModel model = HabitModel(
      title: nameController.text,
      createdAt: habit?.createdAt ?? DateTime.now(),
      activeDates: habit?.activeDates ?? [],
    );
    await habitCreate(model);
    Get.back();
  }
}
