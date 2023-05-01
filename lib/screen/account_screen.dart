import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner_project/screen/privacy_policy.dart';
import 'package:wedding_planner_project/screen/question_answer_screen.dart';
import 'package:wedding_planner_project/screen/saved_shortlisted_screen.dart';
import 'package:wedding_planner_project/screen/support_screen.dart';

import 'about_us.dart';

class serviceDetails {
  String? serviceTitle;
  String? serviceSubtitle;
  Icon? serviceIcon;

  serviceDetails({this.serviceIcon, this.serviceTitle, this.serviceSubtitle});
}

class AccountDetails extends StatefulWidget {
  AccountDetails({Key? key}) : super(key: key);

  @override
  State<AccountDetails> createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {
  List<serviceDetails> serviceList = [
    serviceDetails(
        serviceIcon: Icon(Icons.favorite, color: Color(0xffac6e74)),
        serviceSubtitle: "View all Saved & Shortlisted items",
        serviceTitle: "Saved & Shortlists"),
    serviceDetails(
        serviceIcon: Icon(Icons.error, color: Color(0xffac6e74)),
        serviceSubtitle: "Who we are & How we started",
        serviceTitle: "About us"),
    serviceDetails(
        serviceIcon: Icon(Icons.email, color: Color(0xffac6e74)),
        serviceSubtitle: "Connect us for issue &",
        serviceTitle: "Support"),
    serviceDetails(
        serviceIcon: Icon(Icons.description, color: Color(0xffac6e74)),
        serviceSubtitle: "Know Our Privacy Policies",
        serviceTitle: "Privacy Policy"),
    serviceDetails(
        serviceIcon: Icon(Icons.live_help, color: Color(0xffac6e74)),
        serviceSubtitle: "Get your Questions Answered",
        serviceTitle: "FAQs"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: BackButton(
          color: Colors.black,
        ),
        title: Container(
          alignment: Alignment.center,
          child: Text(
            "Account",
            style: TextStyle(fontSize: 20.sp, color: Colors.black),
          ),
        ),
        actions: [
          Container(
            width: 50,
          )
        ],
      ),
      body: Column(
        children: [
          Container(
              margin: EdgeInsets.only(left: 15, right: 20),
              color: Colors.white,
              height: 12.h,
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 1.3.h,
                      ),
                      Container(
                        child: Text(
                          "Niral Panchal",
                          style: TextStyle(
                            fontSize: 24.sp,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 0.7.h,
                      ),
                      Container(
                        child: Text(
                          "My Profile",
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: Color(0xFFBDBDBD),
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(bottom: 30),
                    height: 90,
                    width: 80,
                    decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://lh3.googleusercontent.com/pw/AJFCJaUDENPUVHhPCQk2az37tIHYl1lcpO4XId1_ssjDpMPJl_l7hDQWOJn-F9oNdVbZjoDZ4WpjH0ibolOZPH7gj_sc9hC3cQwWJ0MMAjTaQ_nqlPamenqNuoCYeCdZnGi3T5ycXWKr_uDy0zoyCStD5p0L5Q=w721-h961-s-no"),
                            fit: BoxFit.cover)),
                  )
                ],
              )),
          Expanded(
            child: Container(
              height: 20.h,
              width: 100.w,
              decoration: BoxDecoration(
                  color: Color(0xffac6e74),
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(30))),
              child: Column(
                children: [
                  Container(
                      padding: EdgeInsets.only(top: 10),
                      width: 98.w,
                      height: 11.h,
                      child: Container(
                        margin: EdgeInsets.only(top: 15, left: 15, right: 15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.question_answer,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Inbox",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                  "All your Conversations",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.white,
                              size: 25,
                            ),
                          ],
                        ),
                      )),
                  SingleChildScrollView(
                    child: Container(
                      height: 67.2.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(30))),
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              margin:
                                  EdgeInsets.only(left: 20, right: 15, top: 15),
                              child: ListView.builder(
                                  itemCount: serviceList.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                        margin: EdgeInsets.only(bottom: 2.8.h),
                                        child: GestureDetector(
                                            onTap: () {
                                              var screen = SavedShortListed();
                                              switch (index) {
                                                case 0:
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              SavedShortListed()));
                                                  break;
                                                case 1:
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              AboutUsScreen()));
                                                  break;
                                                case 2:
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              SupportScreen()));
                                                  break;

                                                case 3:
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              PrivacyPolicyScreen()));
                                                  break;
                                                case 4:
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              FaQsScreen()));
                                                  break;
                                              }
                                            },
                                            child: Row(
                                              children: [
                                                Container(
                                                  child: serviceList[index]
                                                      .serviceIcon,
                                                ),
                                                SizedBox(
                                                  width: 15,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 15),
                                                        child: Text(
                                                          serviceList[index]
                                                              .serviceTitle
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        )),
                                                    SizedBox(
                                                      height: 0.5.h,
                                                    ),
                                                    Text(
                                                      serviceList[index]
                                                          .serviceSubtitle
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          color:
                                                              Color(0xFFBDBDBD),
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            )));
                                  }),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
