import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shamiri/application/core/themes/colors.dart';

Future<bool> showAlertDialog(
        {required String title,
        required IconData iconData,
        required Widget content,
        required VoidCallback onCancel,
        required VoidCallback onConfirm}) async =>
    await showDialog(
        context: Get.context!,
        builder: (context) => AlertDialog(
              title: Text(title),
              titleTextStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              icon: Icon(iconData, color: XploreColors.deepBlue),
              backgroundColor: XploreColors.white,
              scrollable: true,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              content: Container(
                child: Column(
                  children: [
                    //  content
                    content,
                    //  buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: onCancel,
                            style: TextButton.styleFrom(
                                foregroundColor: XploreColors.xploreOrange),
                            child: Text("cancel")),
                        TextButton(
                            onPressed: onConfirm,
                            style: TextButton.styleFrom(
                                foregroundColor: XploreColors.xploreOrange),
                            child: Text("confirm")),
                      ],
                    )
                  ],
                ),
              ),
            ));
