import 'package:flutter/material.dart';
import 'package:shamiri/features/feature_onboarding/presentation/components/image_picker_item.dart';

class ImagePickerBottomSheet extends StatelessWidget {
  const ImagePickerBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Pick profile image"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ImagePickerItem(
                iconData: Icons.camera_alt_rounded, title: "Camera", onTap: () {}),
            ImagePickerItem(
                iconData: Icons.image_rounded, title: "Gallery", onTap: () {}),
            ImagePickerItem(
                iconData: Icons.delete_forever_rounded,
                title: "Remove Profile",
                onTap: () {}),
          ],
        ),
      ],
    );
  }
}
