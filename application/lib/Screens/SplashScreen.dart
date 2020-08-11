import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/Helper/DBProvider.dart';
import 'package:food_app/Screens/LoginScreen.dart';
import 'package:food_app/constants/colors.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(seconds: 3),
        () =>
            Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => LoginScreen())));
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: primaryDarkColor,
            child: Center(
              child: Icon(
                Icons.fastfood,
                size: 150.0,
                color: Colors.black,
              )
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(bottom: 20.0),
            child: Text(
              "Powered by Shanindu Rajapaksha",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.0
              ),
            ),
          )
        ],
      ),
    );
  }
}
