import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner_project/screen/vendors_page.dart';
import 'package:wedding_planner_project/screen/venue_screen.dart';

import '../widgets/common_TextField.dart';
import '../widgets/common_button.dart';

class PhoneAuthentication extends StatefulWidget {
  const PhoneAuthentication({Key? key}) : super(key: key);

  static String verify = "";

  @override
  State<PhoneAuthentication> createState() => _PhoneAuthenticationState();
}

class _PhoneAuthenticationState extends State<PhoneAuthentication> {
  TextEditingController _textEditingController = TextEditingController();
  PageController pageController = PageController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  int pageChanged = 0;
  var phone = "";
  var code = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              pageChanged = index;
            });
          },
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: 100.h,
                      width: 100.w,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/background_img.png"),
                            fit: BoxFit.contain),
                      ),
                      padding: EdgeInsets.only(top: 40.h, right: 10, left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text("ENTER MOBILE NUMBER :", style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15.sp,color: Color(0xff8E9F5A))),

                          CommonTextField(
                              inputType: TextInputType.phone,
                              fillCollor: Colors.transparent,
                              onchanged: (value) {
                                phone = value;
                              },
                              digits: [
                                LengthLimitingTextInputFormatter(10),
                              ]),
                          SizedBox(
                            height: 28.h,
                          ),
                          CommonButton(
                              btntext: "Next",
                              onpress: () async {
                                await FirebaseAuth.instance.verifyPhoneNumber(
                                  phoneNumber: '+91${phone}',
                                  verificationCompleted:
                                      (PhoneAuthCredential credential) {},
                                  verificationFailed:
                                      (FirebaseAuthException e) {},
                                  codeSent: (String verificationId,
                                      int? resendToken) {
                                    PhoneAuthentication.verify = verificationId;
                                    pageController.animateToPage(++pageChanged,
                                        duration: Duration(milliseconds: 250),
                                        curve: Curves.bounceInOut);
                                  },
                                  codeAutoRetrievalTimeout:
                                      (String verificationId) {},
                                );
                              })
                        ],
                      )),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Container(
                height: 100.h,
                width: 100.w,
                padding: EdgeInsets.only(left: 20, right: 20),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/Group 234.png"), fit: BoxFit.cover),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                        padding: EdgeInsets.only(left: 20, right: 20,top: 25.h),
                        child: Text("E N T E R", style: TextStyle(fontWeight: FontWeight.w800,fontSize: 45.sp,color: Color(0xff8E9F5A)),)),
                    Container(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Text("O T P", style: TextStyle(fontWeight: FontWeight.w800,fontSize: 45.sp,color: Color(0xff8E9F5A)),)),
                    SizedBox(height: 2.h,),
                    Container(
                        padding: EdgeInsets.only(left: 20, right: 20,),
                        child: PinCodeTextField(appContext: context,
                          controller: _textEditingController,
                          keyboardType: TextInputType.phone,
                          length: 6,
                          cursorHeight: 19,
                          enableActiveFill: true,
                          textStyle: TextStyle(fontSize: 24.sp,fontWeight: FontWeight.w800,color: Colors.white),
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            fieldHeight: 50,
                            inactiveColor: Colors.grey,
                            selectedColor: Color(0xff8E9F5A),
                            activeFillColor: Color(0xff8E9F5A),
                            activeColor: Color(0xff8E9F5A),
                            selectedFillColor: Color(0xff8E9F5A),
                            inactiveFillColor: Color(0xff8E9F5A),
                            borderRadius: BorderRadius.circular(14),
                            borderWidth: 1,
                          ),
                          onChanged: (value) {
                            code = value;
                          },
                        )
                      /*CommonTextField(
                          textfield: "Enter Valid Otp:",
                          fillCollor: Colors.transparent,
                          onchanged: (value) {
                            code = value;
                          },
                          inputType: TextInputType.phone),*/
                    ),
                    SizedBox(height: 30.h,),
                    CommonButton(
                        btntext: "Verify",
                        onpress: () async {
                          PhoneAuthCredential credential =
                          PhoneAuthProvider.credential(
                              verificationId: PhoneAuthentication.verify,
                              smsCode: code);
                          // Sign the user in (or link) with the credential
                          await auth.signInWithCredential(credential);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => VendorsScreen()));
                        }),
                  ],
                ),
              ),
            ),
          ]),
    );
  }
}
