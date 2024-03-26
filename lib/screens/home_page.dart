import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:got/constant/app_color.dart';
import 'package:got/controller/home_controller.dart';
import 'package:got/screens/data_page.dart';
import 'package:got/widget/text_widget.dart';
import 'package:page_flip/page_flip.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: controller.isDarkMode.value
              ? AppColor.blackColor
              : AppColor.whiteColor,
          actions: [
            Obx(
              () => GestureDetector(
                onTap: () {
                  controller.toggleDarkMode();
                },
                child: Row(
                  children: [
                    controller.isDarkMode.value
                        ? BigText(
                            text: 'Dark',
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: controller.isDarkMode.value
                                ? AppColor.darkBlue
                                : AppColor.lightBlue,
                          )
                        : BigText(
                            text: 'Light',
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: controller.isDarkMode.value
                                ? AppColor.darkBlue
                                : AppColor.lightBlue,
                          ),
                    IconButton(
                        onPressed: () {
                          controller.toggleDarkMode();
                        },
                        icon: controller.isDarkMode.value
                            ? Icon(
                                Icons.dark_mode,
                                color: AppColor.darkBlue,
                              )
                            : Icon(
                                Icons.light_mode,
                                color: AppColor.lightBlue,
                              )),
                  ],
                ),
              ),
            )
          ],
        ),
        body: PageFlipWidget(
            key: controller.pageFlipController,
            initialIndex: 0,
            duration: const Duration(milliseconds: 500),
            children: List.generate(9, (index) => DataPage(page: index))),
      ),
    );
  }
}
