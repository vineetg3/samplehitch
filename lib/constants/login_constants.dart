import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:samplehitch/constants/theme_constants.dart';

Widget khitchTagline = ColorizeAnimatedTextKit(
    speed: Duration(milliseconds: 500),
    colors: [
      Colors.white,
      kMaroon,
      kLightPurple,
      kYellow,
      kDarkPurple,
    ],
    repeatForever: true,
    onTap: () {
      print("Tap Event");
    },
    text: [
      "Events",
      "Community",
      "You",
    ],
    textStyle: TextStyle(
        fontSize: 27.0,
        fontFamily: 'Sanchez',
        color: kLightPurple
    ),
    textAlign: TextAlign.center,
    alignment: AlignmentDirectional.topStart
);