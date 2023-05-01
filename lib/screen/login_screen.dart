import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wedding_planner_project/screen/venueDetails_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner_project/screen/register_page.dart';
import 'package:wedding_planner_project/widgets/common_TextField.dart';
import '../widgets/common_text.dart';
import 'cache.dart';
import 'cache2.dart';
import 'google_signin.dart';
import 'hello.dart';
import 'map_utils.dart';
import 'otherscreen.dart';
import 'otp_verification.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isSigningIn = false;
  var phone = "";
  bool isChecked = true;
  bool isChecked1 = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Stack(
            children: [
              Container(
                width: 500,
                height: 450,
                color: Colors.white,
              ),
              Container(
                margin: const EdgeInsets.only(left: 100, top: 60),
                child: Image.asset(
                  "assets/WEDPLAN-removebg-preview.png",
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(left: 100, top: 318),
                  child: Image.network(
                    "https://img.freepik.com/free-vector/cute-wedding-couple-character-illustration_188398-359.jpg?size=626&ext=jpg",
                    width: 200,
                    fit: BoxFit.cover,
                  ))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) => RegisterPage(),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    return ScaleTransition(
                      scale: Tween<double>(begin: 0.0, end: 1.0).animate(
                        CurvedAnimation(
                          parent: animation,
                          curve: Curves.easeInOut,
                        ),
                      ),
                      child: child,
                    );
                  },

                ),              );
            },
            child:  Text(
              "Sign In now",
              style: TextStyle(
                  fontSize: 11.sp,
                  color: Color(0xFFBDBDBD),
                  fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          Container(
            margin: const EdgeInsets.only(left: 10, right: 30),
            child: Container(
              margin: const EdgeInsets.only(left: 10, right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text("Phone Number",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                  const SizedBox(
                    height: 10,
                  ),
                  CommonTextField(
                      textfield: "Enter Phone Number",
                      inputType: TextInputType.number,
                      onchanged: (value) {
                        phone = value;
                      },
                      digits: [
                        LengthLimitingTextInputFormatter(10),
                      ]),
                  GestureDetector(
                      onTap: () async {
                        await FirebaseAuth.instance.verifyPhoneNumber(
                          phoneNumber: '+91${phone}',
                          verificationCompleted:
                              (PhoneAuthCredential credential) {},
                          verificationFailed:
                              (FirebaseAuthException e) {},
                          codeSent: (String verificationId,
                              int? resendToken) {
                            PhoneAuthentication.verify = verificationId;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                    const VerificationScreen()));
                          },
                          codeAutoRetrievalTimeout:
                              (String verificationId) {},
                        );
                      },
                    child: Container(
                      margin:  EdgeInsets.only(left: 8.w, top: 8.w),
                      height: 15.w,
                      width: 50.w,
                      decoration: BoxDecoration(
                          color: const Color(0xffac6e74), //ce969f
                          borderRadius: BorderRadius.circular(30)),
                      padding:  EdgeInsets.only(top: 5.w),
                      child: const Text(
                        'C O N T I N U E',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(height: 4.w,),
                  Container(
                    margin: EdgeInsets.only(left: 8.w),
                    child: Center(
                      child:  Text(
                        "Or Countinue with",
                        style: TextStyle(
                            fontSize: 11.sp,
                            color: Color(0xFFBDBDBD),
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  SizedBox(height: 4.w,),
                ],
              ),
            ),
          ),
        ]),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(left: 2.w,right: 2.w,bottom: 2.w),
        padding: EdgeInsets.only(left: 8.w),
        width: 100.w,
        height: 20.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.w),
          color: const Color(0xffac6e74),
        ),
        child: Row(
          children: [
            FutureBuilder(
              future: Authentication.initializeFirebase(context: context),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Error initializing Firebase');
                } else if (snapshot.connectionState == ConnectionState.done) {
                  return Container(
                      child: _isSigningIn
                          ? CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(Colors.green),
                            )
                          : GestureDetector(
                              onTap: () async {
                                setState(() {
                                  _isSigningIn = true;
                                });
                                User? user =
                                    await Authentication.signInWithGoogle(
                                        context: context);
                                setState(() {
                                  _isSigningIn = false;
                                  print(user);
                                });
                                if (user != null) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              VanueDetails()));
                                }
                              },
                              child: Row(
                                children: [
                                  Container(
                                    child: Image.asset(
                                      "assets/googleicon-removebg-preview.png",
                                      width: 30,
                                      height: 30,
                                    ),
                                  ),
                                  SizedBox(width: 2.w,),
                                  const Text("G o o g l e",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600)),
                                ],
                              ),
                            ));
                }
                return CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Color(0xffac6e74)),
                );
              },
            ),
            SizedBox(width: 6.w,),
            const VerticalDivider(
              thickness: 3,
              indent: 25,
              endIndent: 25,
              color: Colors.white,
            ),
             IconButton(
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            CacheScreen1()));
              },
              icon: Icon(
                Icons.facebook,
                color: Colors.white,
                size: 35,
              ),
            ),
            SizedBox(width: 1.w,),
            GestureDetector(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DropdownMenuPage()));
              },
              child: const Text("F a c e b o o k",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600)),
            ),
          ],
        ),
      ),
    );
  }
}
