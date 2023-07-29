import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSnackbar(
        {required String title,
        required String message,
        required IconData iconData,
        required Color iconColor}) =>
    Get.showSnackbar(GetSnackBar(
      titleText: Text(
        title,
        style: TextStyle(
            fontWeight: Theme.of(Get.context!).textTheme.bodyMedium?.fontWeight,
            fontSize: Theme.of(Get.context!).textTheme.bodyMedium?.fontSize,
            color: Colors.white),
      ),
      messageText: Text(
        message,
        style: TextStyle(
            fontWeight: Theme.of(Get.context!).textTheme.bodySmall?.fontWeight,
            fontSize: Theme.of(Get.context!).textTheme.bodySmall?.fontSize,
            color: Colors.white),
      ),
      icon: Icon(
        iconData,
        size: 16,
        color: iconColor,
      ),
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      duration: const Duration(seconds: 3),
      borderRadius: 16,
      isDismissible: true,
    ));
