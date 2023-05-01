import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SearchScrreen extends StatefulWidget {
  const SearchScrreen({Key? key}) : super(key: key);

  @override
  State<SearchScrreen> createState() => _SearchScrreenState();
}

class _SearchScrreenState extends State<SearchScrreen> {
  List<String> servicelist = [
    "Choreographer",
    "Candid Photographer",
    "Bride Wear",
    "Catering",
    "Music & Dance",
    "Invitation & Gift",
    "View all Venues",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Wedplan",style: TextStyle(fontFamily: 'Pugsley',decoration: TextDecoration.none,color: Colors.white,fontWeight: FontWeight.w500,fontSize: 25.sp),),
        leading: Container(),
        elevation: 0,
        backgroundColor: Color(0xffac6e74),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 4.h, left: 15, right: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 100.w,
                height: 7.h,
                padding: EdgeInsets.zero,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        size: 30,
                      ),
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    const VerticalDivider(
                      thickness: 1,
                      width: 1,
                      indent: 20,
                      endIndent: 20,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 1.h),
                      width: 70.w,
                      height: 60,
                      child: const TextField(
                        autofocus: true,
                        style: TextStyle(fontSize: 22, color: Colors.black),
                        showCursor: false,
                        decoration: InputDecoration(
                          hintText: 'Enter Name',
                          hintStyle:
                              TextStyle(fontSize: 22, color: Colors.grey),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const Icon(Icons.search_sharp,
                        size: 22, color: Color(0xffac6e74)),
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.only(bottom: 3.h),
                  child: const Divider(
                    color: Colors.black,
                  )),
              Container(
                height: 32.5.h,
                margin: const EdgeInsets.only(right: 15),
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 2.h),
                        child: Row(
                          children: [
                            const Icon(Icons.schedule_outlined,
                                color: Color(0xffac6e74)),
                            const SizedBox(
                              width: 18,
                            ),
                            Text(
                              servicelist[index].toString(),
                              style: const TextStyle(
                                fontSize: 22,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
              Image.asset("assets/searchoption.png")
            ],
          ),
        ),
      ),
    );
  }
}
