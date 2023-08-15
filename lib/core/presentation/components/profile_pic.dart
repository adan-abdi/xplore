import 'package:flutter/material.dart';

import '../../../application/core/themes/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
              child: CachedNetworkImage(
                  imageUrl: imageUrl!,
                  placeholder: (context, url) => Icon(
                        Icons.person_rounded,
                        color: XploreColors.white,
                      )))
          : Center(
              child: Icon(
                Icons.person_rounded,
                color: XploreColors.white,
              ),
            ),
    );
  }
}
