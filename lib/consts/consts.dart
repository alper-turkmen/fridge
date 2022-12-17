import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/socialmediaicon_model.dart';

class ColorList {
  static Color mainColor = Color(0xFF43B658);
  static Color secondColor = Color.fromRGBO(185, 206, 220, 0.8);

  static Color googleColor = Color(0xFFD9534F);
  static Color faceColor = Color(0xFF2D4373);
  static Color secondGreen = Color(0xFFD8E8D4);
  static Color whiteColor = Color(0xFFFFFFFF);
  static Color blackColor = Color(0x00000000);
}

class SharedList {
  static List<SocialMediaIconModel> socialMediaIcon = [
    SocialMediaIconModel(
      socialMediaName: "Apple",
      buttonIcon: FaIcon(
        FontAwesomeIcons.apple,
        color: ColorList.blackColor,
      ),
    ),
    SocialMediaIconModel(
      socialMediaName: "Facebook",
      buttonIcon: FaIcon(
        FontAwesomeIcons.facebook,
        color: ColorList.faceColor,
      ),
    ),
    SocialMediaIconModel(
      socialMediaName: "Google",
      buttonIcon: FaIcon(
        FontAwesomeIcons.google,
        color: Color(
          0xFFFFFFFF,
        ),
      ),
    ),
  ];
}
