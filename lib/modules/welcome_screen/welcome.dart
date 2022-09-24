import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iti_project/modules/adv_screen/onboardeing.dart';
import '../adv_screen/before_login.dart';

class Logo_screen extends StatefulWidget {
  const Logo_screen({Key? key}) : super(key: key);

  @override
  State<Logo_screen> createState() => _Logo_screenState();
}

class _Logo_screenState extends State<Logo_screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 1), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => onBoarding()),
          (Route<dynamic> route) => false);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome",
                style: GoogleFonts.playball(
                  textStyle: Theme.of(context).textTheme.headline4,
                  fontSize: 60,
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
