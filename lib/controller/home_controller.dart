import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:page_flip/page_flip.dart';

class HomeController extends GetxController {
  final GlobalKey<PageFlipWidgetState> pageFlipController =
      GlobalKey<PageFlipWidgetState>();
  RxBool isDarkMode = false.obs;

  @override
  void onInit() {
    super.onInit();
    onStartUp();
  }

  Future<void> onStartUp() async {
    _loadDarkMode();
  }

  void toggleDarkMode() {
    isDarkMode.toggle();
    update();
    _saveDarkMode();
  }

  void _saveDarkMode() {
    final box = GetStorage();
    box.write('isDarkMode', isDarkMode.value);
  }

  void _loadDarkMode() {
    final box = GetStorage();
    if (box.hasData('isDarkMode')) {
      isDarkMode.value = box.read('isDarkMode') ?? false;
    }
  }
}
