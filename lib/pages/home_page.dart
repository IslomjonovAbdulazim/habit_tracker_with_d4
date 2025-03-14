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
            onPressed: () async {
              await Get.to(CreatePage());
              controller.load();
            },
            child: Icon(CupertinoIcons.add),
          ),
        ],
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.habits.length,
          padding: EdgeInsets.symmetric(horizontal: 20),
          itemBuilder: (context, index) {
            final habit = controller.habits[index];
            return _HabitWidget(
              habit: habit,
              play: controller.play,
              update: controller.load,
            );
          },
        ),
      ),
    );
  }
}

class _HabitWidget extends StatefulWidget {
  final HabitModel habit;
  final VoidCallback play;
  final VoidCallback update;

  const _HabitWidget(
      {super.key,
      required this.habit,
      required this.play,
      required this.update});

  @override
  State<_HabitWidget> createState() => _HabitWidgetState();
}

class _HabitWidgetState extends State<_HabitWidget> {
  List<DateTime> dates = [];

  @override
  void initState() {
    init();
    super.initState();
  }

  void init() {
    final now = DateTime.now();

    for (int i = 0; i < 200; i++) {
      dates.add(now.subtract(Duration(days: i)));
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  widget.habit.title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              CupertinoButton(
                color: Colors.red,
                padding: EdgeInsets.zero,
                onPressed: () {},
                child: Icon(CupertinoIcons.delete),
              ),
              SizedBox(width: 5),
              CupertinoButton(
                color: isActive(DateTime.now(), widget.habit.activeDates)
                    ? Colors.green
                    : Colors.grey,
                padding: EdgeInsets.zero,
                onPressed: () async {
                  await habitCheck(widget.habit, DateTime.now());
                  widget.update();
                  widget.play();
                },
                child: Icon(CupertinoIcons.checkmark_alt),
              ),
            ],
          ),
          SizedBox(
            height: 150,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
              itemCount: dates.length,
              itemBuilder: (context, index) {
                final d = dates[index];
                return AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  margin: EdgeInsets.all(1.5),
                  decoration: BoxDecoration(
                    color: isActive(d, widget.habit.activeDates)
                        ? Colors.green
                        : Colors.grey,
                    borderRadius: BorderRadius.circular(5),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
