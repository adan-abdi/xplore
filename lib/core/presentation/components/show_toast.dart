import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shamiri/application/core/themes/colors.dart';

Widget customToast({required IconData iconData, required String msg}) =>
    IgnorePointer(
      ignoring: true,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: XploreColors.deepBlue),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              iconData,
              color: XploreColors.xploreOrange,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              msg,
              style: TextStyle(
                fontSize: Theme.of(Get.context!).textTheme.bodySmall?.fontSize,
                fontWeight: Theme.of(Get.context!).textTheme.bodySmall?.fontWeight,
                color: XploreColors.white
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );

void showToast(
        {required FToast toast,
        required IconData iconData,
        required String msg}) =>
    toast.showToast(
        child: customToast(iconData: iconData, msg: msg),
        gravity: ToastGravity.BOTTOM);

void cancelToast() => Fluttertoast.cancel();
