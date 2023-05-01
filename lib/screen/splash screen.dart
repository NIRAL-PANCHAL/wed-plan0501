
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5),
            ()=>
        Navigator.push(context,
            MaterialPageRoute(builder:
                (context) => LoginScreen()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        margin: EdgeInsets.only(top: 25.w),
        padding: EdgeInsets.all(25.w),
        width: 5.w,
        height: 5.w,
        decoration: BoxDecoration(
            color: Colors.white,
          borderRadius: BorderRadius.circular(3.w)
        ),

        child: Column(
          children: [
            Text("Wedplan",style: TextStyle(fontFamily: 'Pugsley',decoration: TextDecoration.none,color: Color(0xffac6e74),fontWeight: FontWeight.w500),),
            Image.asset("assets/splash_photo-removebg-preview.png",width:70.w,height: 70.w),
          ],
        ),
      ),
    );
  }
}
