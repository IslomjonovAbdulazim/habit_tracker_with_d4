import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HabitModel extends Equatable {
  late DateTime createdAt;
  late String title;
  late List<DateTime> activeDates;

  // constructor
  HabitModel({
    required this.createdAt,
    required this.title,
    required this.activeDates,
  });

  // fromJson = read
  HabitModel.fromJson(Map json) {
    createdAt = DateTime.parse(json['createdAt']);
    title = json['title'];
    activeDates = List.from(json["activeDates"])
        .map((date) => DateTime.parse(date))
        .toList();
  }

  // toJson  = write
  Map toJson() => {
        "createdAt": createdAt.toIso8601String(),
        "title": title,
        "activeDates":
            activeDates.map((date) => date.toIso8601String()).toList(),
      };

  List get props => [createdAt];
}

Future<List<HabitModel>> habitReadAll() async {
  final db = await SharedPreferences.getInstance();
  String? data = db.getString("habits");
  List<HabitModel> result = [];
  if (data != null) {
    List jsonList = jsonDecode(data);
    result = jsonList.map((json) => HabitModel.fromJson(json)).toList();
  }
  result.sort((a, b) => a.createdAt.compareTo(b.createdAt));
  return result;
}

Future<void> habitWriteAll(List<HabitModel> habits) async {
  final db = await SharedPreferences.getInstance();
  List jsonList = habits.map((model) => model.toJson()).toList();
  String data = jsonEncode(jsonList);
  await db.setString("habits", data);
}

Future<void> habitCreate(HabitModel habit) async {
  List<HabitModel> habits = await habitReadAll();
  habits.removeWhere((model) => model == habit);
  habits.add(habit);
  await habitWriteAll(habits);
}

Future<void> habitDelete(HabitModel habit) async {
  List<HabitModel> habits = await habitReadAll();
  habits.removeWhere((model) => model == habit);
  await habitWriteAll(habits);
}

Future<void> habitCheck(HabitModel habit, DateTime date) async {
  List<HabitModel> habits = await habitReadAll();
  habits.removeWhere((model) => model == habit);
  if (isActive(date, habit.activeDates)) {
    habit.activeDates.removeWhere((other) => compareDates(date, other));
  } else {
    habit.activeDates.add(date);
  }
  habits.add(habit);
  await habitWriteAll(habits);
}

bool isActive(DateTime date, List<DateTime> activeDates) {
  List result = activeDates.where((other) => compareDates(date, other)).toList();
  return result.isNotEmpty;
}

bool compareDates(DateTime date, DateTime other) {
  if (date.year == other.year &&
      date.month == other.month &&
      date.day == other.day) {
    return true;
  } else {
    return false;
  }
}
