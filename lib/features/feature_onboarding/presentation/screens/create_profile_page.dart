import 'package:flutter/material.dart';
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../components/login_title.dart';

class CreateProfilePage extends StatefulWidget {
  const CreateProfilePage({super.key});

  @override
  State<CreateProfilePage> createState() => _CreateProfilePageState();
}

class _CreateProfilePageState extends State<CreateProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: XploreColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...titles(
                  context: context,
                  extraHeading: "Let's create your new profile!",
                  subtitle: 'Create Profile',
                  title: 'Welcome! \n',
                ),

                vSize40SizedBox,

                Align(
                  alignment: AlignmentDirectional.center,
                  child: Container(
                    width: 150,
                    height: 150,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200),
                      color: XploreColors.deepBlue,
                    ),
                    child: SvgPicture.asset("assets/general/profile.svg"),
                  ),
                ),

                vSize40SizedBox,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
