import 'package:flutter/material.dart';

Color primaryDarkColor = Color.fromRGBO(241, 196, 15, 1);
Color primaryLightColor = Color.fromRGBO(241, 196, 15, 0.6);

var roundedRectangle = RoundedRectangleBorder(
  borderRadius: BorderRadiusDirectional.circular(12),
  side: BorderSide(width: 0.1, color: primaryDarkColor),
);

var roundedRectangle32 = RoundedRectangleBorder(
  borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
);
