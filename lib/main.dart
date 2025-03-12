import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

import 'pages/home_page.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => HabitTrackerApp(),
    ),
  );
}

class HabitTrackerApp extends StatelessWidget {
  const HabitTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
