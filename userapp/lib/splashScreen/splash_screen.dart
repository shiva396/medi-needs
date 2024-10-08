import 'dart:async';

import 'package:flutter/material.dart';
import 'package:userapp/assistants/assistant_methods.dart';
import 'package:userapp/authentication/login_screen.dart';
import 'package:userapp/global/constants.dart';
import 'package:userapp/global/global.dart';
import 'package:userapp/mainScreens/main_screen.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({Key? key}) : super(key: key);

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  startTimer() {
    fAuth.currentUser != null
        ? AssistantMethods.readCurrentOnlineUserInfo()
        : null;

    Timer(const Duration(seconds: 3), () async {
      if (await fAuth.currentUser != null) {
        currentFirebaseUser = fAuth.currentUser;
        Navigator.push(
            context, MaterialPageRoute(builder: (c) => MainScreen()));
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (c) => LoginScreen()));
      }
    });
  }

  @override
  void initState() {
    // by default executed at the start
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: kBackgroundColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("images/logo1.png"),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Medi Needs",
                style: TextStyle(
                  fontSize: 25,
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
