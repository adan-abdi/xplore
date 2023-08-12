import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> showAlertDialog(
        {required String title,
        required IconData iconData,
        required Widget content}) async =>
    await showDialog(
        context: Get.context!,
        builder: (context) => AlertDialog(
              title: Text(title),
              titleTextStyle: Theme.of(context).textTheme.titleSmall,
              icon: Icon(iconData, color: Theme.of(context).primaryColor),
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              scrollable: true,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              content: content,
            ));
