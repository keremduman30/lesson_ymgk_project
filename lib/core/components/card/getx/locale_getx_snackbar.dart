import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocalGetSnackBar {
  static SnackbarController localeGetSnackBar({String? message}) {
    return Get.snackbar(
      "",
      message ?? "",
      icon: const Icon(Icons.cancel, color: Colors.white),
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.red,
      borderRadius: 10,
      margin: const EdgeInsets.all(10),
      colorText: Colors.white,
      duration: const Duration(seconds: 2),
      isDismissible: true,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }
}
