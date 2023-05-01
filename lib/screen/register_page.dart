import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../widgets/common_TextField.dart';
import '../widgets/common_appbar.dart';
import 'main_screen.dart';
import 'otp_verification.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(
          appbarText: "",
          bgcolor: Color(0xFFEEEEEE),
          leading: BackButton(
            color: Colors.black,
          )),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(top: 10),
              color: Color(0xFFEEEEEE),
              width: 400,
              height: 130,
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: Text(
                    "Register",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                  ),
                ),
                subtitle: Text(
                  "In less than a minute",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFFBDBDBD),
                        fontWeight: FontWeight.w700),
                ),
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Container(
              margin: EdgeInsets.only(left: 25,right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text("Full Name",style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                  CommonTextField(textfield: "Enter Full Name",),
                  SizedBox(
                    height: 35,
                  ),
                  Text("Email Address",style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                  CommonTextField(textfield: "Enter Email Address",),
                  SizedBox(
                    height: 35,
                  ),
                  Text("Phone Number",style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                  CommonTextField(textfield: "Enter Phone Number",
                    inputType: TextInputType.number,
                  ),
                ],
              ),
            ),
            SizedBox(height: 5.w,),
            Text("We'll send verification code.", style: TextStyle(
                fontSize: 11.sp,
                color: Color(0xFFBDBDBD),
                fontWeight: FontWeight.w700),),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MainPage()));
              },
              child: Container(
                margin:  EdgeInsets.only(left: 8.w, top: 35.w,right: 8.w),
                height: 15.w,
                width: 80.w,
                decoration: BoxDecoration(
                    color: Color(0xffac6e74),//ce969f
                    borderRadius: BorderRadius.circular(30)),
                padding: EdgeInsets.only(top: 19),
                child: Text(
                  'C O N T I N U E',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],


        ),
      ),
    );
  }
}
