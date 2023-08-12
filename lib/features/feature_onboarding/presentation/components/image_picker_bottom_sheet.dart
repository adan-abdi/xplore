import 'package:flutter/material.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';
import 'package:shamiri/features/feature_onboarding/presentation/components/round_toggle_button.dart';

class ImagePickerBottomSheet extends StatelessWidget {
  final VoidCallback onCameraTap;
  final VoidCallback onGalleryTap;
  final VoidCallback onRemoveTap;

  const ImagePickerBottomSheet(
      {super.key,
      required this.onCameraTap,
      required this.onGalleryTap,
      required this.onRemoveTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Pick profile image",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        vSize20SizedBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RoundToggleButton(
                iconData: Icons.camera_alt_rounded,
                title: "Camera",
                onTap: onCameraTap),
            RoundToggleButton(
                iconData: Icons.image_rounded,
                title: "Gallery",
                onTap: onGalleryTap),
            RoundToggleButton(
                iconData: Icons.delete_forever_rounded,
                title: "Remove Profile",
                onTap: onRemoveTap),
          ],
        ),
      ],
    );
  }
}
