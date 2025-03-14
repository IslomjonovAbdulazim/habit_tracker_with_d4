import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/create_controller.dart';

class CreatePage extends GetView<CreateController> {
  const CreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CreateController());
    return Scaffold(
      backgroundColor: Color(0xff09090A),
      appBar: AppBar(
        backgroundColor: Color(0xff09090A),
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            Get.back();
          },
          child: Icon(
            CupertinoIcons.chevron_left,
            color: Colors.white,
            size: 28,
          ),
        ),
        centerTitle: true,
        title: Text(
          "Habit Details",
          style: GoogleFonts.inter(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: controller.nameController,
                focusNode: controller.focus,
                onTapOutside: (value) => controller.focus.unfocus(),
                maxLength: 30,
                cursorColor: Colors.white,
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                textCapitalization: TextCapitalization.words,
                keyboardAppearance: Brightness.dark,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  hintText: "Name...",
                  hintStyle: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
                  counter: SizedBox.shrink(),
                  filled: true,
                  fillColor: Color(0xff18181B),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 20),
              CupertinoButton(
                color: Color(0xff16A34A),
                borderRadius: BorderRadius.circular(15),
                onPressed: controller.create,
                child: Center(
                  child: Text(
                    "Create",
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
