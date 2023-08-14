import 'package:flutter/material.dart';
import 'package:shamiri/core/domain/model/user_model.dart';

import '../../../../application/core/themes/colors.dart';

class UserProfileCard extends StatelessWidget {
  final UserModel user;

  const UserProfileCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      color: Colors.blue,
      child: Row(
        children: [
          //  profile picture
          UnconstrainedBox(
            child: Container(
              width: 120,
              height: 120,
              margin: const EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                  color: XploreColors.deepBlue,
                  borderRadius: BorderRadius.circular(100)),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: user.userProfilePicUrl != null &&
                          user.userProfilePicUrl!.isNotEmpty
                      ? Image.network(
                          user.userProfilePicUrl!,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        )
                      : Icon(
                          Icons.person_rounded,
                          color: XploreColors.white,
                          size: 48,
                        )),
            ),
          ),
        ],
      ),
    );
  }
}
