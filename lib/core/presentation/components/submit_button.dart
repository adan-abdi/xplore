import 'package:flutter/material.dart';
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/core/presentation/components/my_lottie.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';

class SubmitButton extends StatelessWidget {
  final IconData iconData;
  final String text;
  final bool isLoading;
  final bool isValid;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback? onTap;

  const SubmitButton(
      {super.key,
      required this.iconData,
      required this.text,
      this.isLoading = false,
      required this.isValid,
      this.backgroundColor = XploreColors.deepBlue,
      this.textColor = XploreColors.white,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isValid ? onTap : null,
      child: isLoading
          ? MyLottie(
              lottie: 'assets/general/loading.json',
              width: 50,
              height: 50,
            )
          : Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 8),
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              decoration: BoxDecoration(
                  color: isValid ? backgroundColor : backgroundColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(4)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    iconData,
                    color: textColor,
                    size: 24,
                  ),
                  hSize20SizedBox,
                  Text(
                    text,
                    style: TextStyle(
                        fontSize: 16,
                        color: textColor,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
    );
  }
}
