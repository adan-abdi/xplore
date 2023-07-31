import 'package:flutter/material.dart';
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/core/presentation/components/my_lottie.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';

class SubmitButton extends StatelessWidget {
  final IconData iconData;
  final String text;
  final bool isLoading;
  final Color backgroundColor;
  final VoidCallback? onTap;

  const SubmitButton(
      {super.key,
      required this.iconData,
      required this.text,
      this.isLoading = false,
      this.backgroundColor = XploreColors.deepBlue,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: isLoading
          ? MyLottie(
              lottie: 'assets/general/loading.json',
              width: 50,
              height: 50,
            )
          : UnconstrainedBox(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(16)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      iconData,
                      color: XploreColors.white,
                    ),
                    hSize20SizedBox,
                    Text(
                      text,
                      style: TextStyle(
                          fontSize: 20,
                          color: XploreColors.white,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
