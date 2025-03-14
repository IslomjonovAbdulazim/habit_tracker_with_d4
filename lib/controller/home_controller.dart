import 'package:get/get.dart';
import 'package:habit_tracker_with_d4/models/habit_model.dart';

class HomeController extends GetxController {
  RxList<HabitModel> habits = <HabitModel>[].obs;

  @override
  void onInit() {
    load();
    super.onInit();
  }

  void load() async {
    habits.value = await habitReadAll();
  }
}
