import 'package:flutter/material.dart';
import 'package:get/get.dart';

void openBottomSheet(
        {required Widget content,
        required VoidCallback onComplete,
        double height = 400,
        bool isElevated = false}) =>
    showModalBottomSheet(
      isDismissible: true,
      enableDrag: true,
      showDragHandle: isElevated ? false : true,
      isScrollControlled: true,
      backgroundColor: isElevated
          ? Colors.transparent
          : Theme.of(Get.context!).scaffoldBackgroundColor,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24), topRight: Radius.circular(24))),
      context: Get.context!,
      builder: (context) => isElevated
          ? Container(
              height: height,
              width: double.infinity,
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              child: content,
            )
          : content,
    ).whenComplete(() => onComplete());
