import 'package:get/get.dart';
import 'package:habit_tracker_with_d4/models/habit_model.dart';
import 'package:just_audio/just_audio.dart';

class HomeController extends GetxController {
  RxList<HabitModel> habits = <HabitModel>[].obs;
  AudioPlayer player = AudioPlayer();

  @override
  void onInit() {
    player.setAsset("assets/create.mp3");
    load();
    super.onInit();
  }

  void load() async {
    habits.value = await habitReadAll();
  }
}
