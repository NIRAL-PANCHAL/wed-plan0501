import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:wedding_planner_project/screen/otherscreen.dart';

import '../widgets/common_TextField.dart';
import '../widgets/common_appbar.dart';
import 'main_screen.dart';
class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  static String verify = "";
  TextEditingController _textEditingController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  var code = "";
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
                    "Verification",
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
                  Text("We've sent 6 digit verification code.", style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFFBDBDBD),
                      fontWeight: FontWeight.w700),),
                  SizedBox(height: 35,),
                  Text("Enter Code",style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                  /*CommonTextField(textfield: "Enter 6 digit code",
                    inputType: TextInputType.number,
                  ),*/
                  Container(
                      padding: EdgeInsets.only(top: 20, ),
                      child: PinCodeTextField(appContext: context,
                        controller: _textEditingController,
                        keyboardType: TextInputType.phone,
                        length: 6,
                        cursorHeight: 19,
                        enableActiveFill: true,
                        textStyle: TextStyle(fontSize: 24,fontWeight: FontWeight.w800,color: Colors.white),
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          fieldHeight: 50,
                          selectedColor:  Colors.white,
                          activeFillColor:  Color(0xffac6e74),
                          activeColor: Colors.black12,
                          selectedFillColor: Color(0xffac6e74),
                          inactiveFillColor: Color(0xffac6e74),
                          inactiveColor: Colors.black12,
                          borderRadius: BorderRadius.circular(30),
                          borderWidth: 0.1,
                        ),
                        onChanged: (value) {
                          code = value;
                        },
                      )
                  ),
                ],
              ),
            ),
            SizedBox(height: 50,),

            GestureDetector(
                onTap: () async {
                  PhoneAuthCredential credential =
                  PhoneAuthProvider.credential(
                      verificationId: PhoneAuthentication.verify,
                      smsCode: code);
                  // Sign the user in (or link) with the credential
                  await auth.signInWithCredential(credential);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MainPage()));
                },
              child: Container(
                margin: EdgeInsets.only(top: 25),
                height: 60,
                width: 350,
                decoration: BoxDecoration(
                    color: Color(0xffac6e74),//ce969f
                    borderRadius: BorderRadius.circular(30)),
                padding: EdgeInsets.only(top: 19),
                child: Text(
                  'G E T   S T A R T E D',
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
