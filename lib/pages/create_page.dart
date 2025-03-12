import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/create_controller.dart';

class CreatePage extends GetView<CreateController> {
  const CreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CreateController());
    return Scaffold();
  }
}
