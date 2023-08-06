import 'package:flutter/material.dart';

import '../../../application/core/themes/colors.dart';

class ProfilePic extends StatelessWidget {
  final String? imageUrl;
  final double imageSize;

  const ProfilePic({super.key, required this.imageUrl, this.imageSize = 60});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: imageSize,
      height: imageSize,
      decoration: BoxDecoration(
          color: XploreColors.deepBlue,
          border: imageUrl == null || imageUrl!.isEmpty
              ? Border.all(color: XploreColors.white, width: 5)
              : Border.fromBorderSide(BorderSide.none),
          borderRadius: BorderRadius.circular(100)),
      child: imageUrl != null && imageUrl!.isNotEmpty
          ? ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                imageUrl!,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            )
          : Center(
              child: Icon(
                Icons.person_rounded,
                color: XploreColors.white,
              ),
            ),
    );
  }
}
