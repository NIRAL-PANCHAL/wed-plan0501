import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: Column(
        children: [
          Container(
            height: 50.h,
            padding: EdgeInsets.only(top: 15.w, right: 2.w, left: 2.w),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.arrow_back,
                      size: 28,
                      color: Colors.black,
                    )
                  ],
                ),
                Container(
                  child: Image.asset(
                    "assets/bg_image-removebg-preview.png",
                    width: 220,
                    height: 367,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              height: 88.h,
              width: 100.w,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(30))),
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Who we are?",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 1.3.h,),
                    Container(
                      width: 100.w,
                      height: 18.h,
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut elit euismod, bibendum quam eu, blandit orci. Nulla facilisi. Suspendisse in malesuada leo. Vestibulum eu dolor nulla. Nulla sed enim vel risus pulvinar sollicitudin. Aliquam sit amet sem sed mauris tincidunt semper vitae sed mi. Sed venenatis libero ac lacus fermentum, vitae commodo risus porttitor. Sed ut magna arcu. Integer at magna ut tellus lacinia faucibus vitae vel risus.',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFFBDBDBD),
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                          letterSpacing: 1.2,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    SizedBox(height: 2.h,),
                    Text(
                      "How we started?",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 1.3.h,),
                    Container(
                      width: 100.w,
                      height: 18.h,
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut elit euismod, bibendum quam eu, blandit orci. Nulla facilisi. Suspendisse in malesuada leo. Vestibulum eu dolor nulla. Nulla sed enim vel risus pulvinar sollicitudin. Aliquam sit amet sem sed mauris tincidunt semper vitae sed mi. Sed venenatis libero ac lacus fermentum, vitae commodo risus porttitor. Sed ut magna arcu. Integer at magna ut tellus lacinia faucibus vitae vel risus.',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFFBDBDBD),
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                          letterSpacing: 1.2,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
