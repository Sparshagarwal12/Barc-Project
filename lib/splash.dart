import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:maths/Auth/Login.dart';
import 'package:maths/DashBoard.dart';

class SplashScrn extends StatefulWidget {
  @override
  _SplashScrnState createState() => _SplashScrnState();
}

final auth = FirebaseAuth.instance;

class _SplashScrnState extends State<SplashScrn> {
  void check() {
    if (auth.currentUser() == null) {
      Navigator.pushAndRemoveUntil(
          context,
          CupertinoPageRoute(builder: (context) => UserLogin()),
          (route) => false);
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          CupertinoPageRoute(builder: (context) => DashBoard()),
          (route) => false);
    }
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () => check());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 5,
            ),
            Container(
                height: 200,
                width: 200,
                child: Image(image: AssetImage('assets/images/barc.png'))),
            SizedBox(height: 50),
            Container(
                height: 150,
                child: Image(image: AssetImage('assets/images/sih.png'))),
            SizedBox(
              height: 140,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SpinKitFadingCube(color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
