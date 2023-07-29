import 'package:flutter/material.dart';
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../core/presentation/components/custom_textfield.dart';
import '../components/login_title.dart';

class CreateProfilePage extends StatefulWidget {
  const CreateProfilePage({super.key});

  @override
  State<CreateProfilePage> createState() => _CreateProfilePageState();
}

class _CreateProfilePageState extends State<CreateProfilePage> {
  late final TextEditingController _userNameController;

  @override
  void initState() {
    super.initState();

    _userNameController = TextEditingController();
  }

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
                    child: SvgPicture.asset(
                      "assets/general/profile.svg",
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                      colorFilter:
                          ColorFilter.mode(XploreColors.white, BlendMode.srcIn),
                    ),
                  ),
                ),
                vSize40SizedBox,
                CustomTextField(
                    hint: "Full Name",
                    iconData: Icons.person_rounded,
                    textStyle: TextStyle(fontSize: 18),
                    controller: _userNameController,
                    onChanged: (value){})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
