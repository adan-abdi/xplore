import 'package:flutter/material.dart';
import 'package:shamiri/core/domain/model/user_model.dart';
import 'package:shamiri/core/presentation/components/profile_pic.dart';
import 'package:shamiri/core/utils/extensions/string_extensions.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';

import '../../../../application/core/themes/colors.dart';

class UserProfileCard extends StatelessWidget {
  final UserModel user;

  const UserProfileCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      child: Row(
        children: [
          //  profile picture
          UnconstrainedBox(
              child: ProfilePic(
            imageUrl: user.userProfilePicUrl!,
            imageSize: 100,
          )),

          //  profile details
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //  username
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hello"),
                      Text(user.userName!,
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold)),
                    ],
                  ),

                  vSize20SizedBox,

                  //  phone number
                  Row(
                    children: [
                      //  phone number
                      Row(
                        children: [
                          Icon(Icons.phone_rounded,
                              size: 16, color: XploreColors.xploreOrange),
                          hSize5SizedBox,
                          Text(
                            user.userPhoneNumber!.add254Prefix,
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600),
                          )
                        ],
                      )
                      //  email address
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
