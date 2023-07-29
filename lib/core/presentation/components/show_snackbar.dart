import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shamiri/application/core/themes/colors.dart';

void showSnackbar(
        {required String title,
        required String message,
        required IconData iconData,
        required Color iconColor}) =>
    Get.showSnackbar(GetSnackBar(
      titleText: Text(
        title,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.white),
      ),
      messageText: Text(
        message,
        style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 16,
            color: Colors.white),
      ),
      icon: Icon(
        iconData,
        size: 16,
        color: iconColor,
      ),
      backgroundColor: XploreColors.deepBlue,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      duration: const Duration(seconds: 3),
      borderRadius: 16,
      isDismissible: true,
    ));
