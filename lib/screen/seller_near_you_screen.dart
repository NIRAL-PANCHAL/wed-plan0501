import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner_project/screen/send_message.dart';

import '../widgets/common_appbar.dart';

class TopWearImages extends StatefulWidget {
  String? productname;
  String? productimage;
  String? shopname;
  String? productprice;
  String? productDisp;
  String? productStar;
  List? productsImglist;

  TopWearImages(
      {Key? key,
        this.productsImglist,
       this.productname,
       this.productimage,
       this.shopname,
        this.productDisp,
        this.productStar,
       this.productprice})
      : super(key: key);

  @override
  State<TopWearImages> createState() => _TopWearImagesState();
}

class _TopWearImagesState extends State<TopWearImages> {
  List<String> items = [
    'Color: Rani',
    'Fabric: ART SILK',
    'Garment Type: Lehenga',
    'The Product Price is inclusive of: Lehenga with 1pc Unstitched Blouse, Dupatta Item 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: 100.w,
          ),
          Positioned(
              child: Image.network(
            widget.productimage.toString(),
            fit: BoxFit.cover,
          )),
          Positioned(
            bottom: 0.h,
            child: Container(
              width: 100.w,
              height: 50.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20))),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 15, left: 15, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                widget.productname.toString(),
                                style: const TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w600),
                              ),
                              Spacer(),
                              const Icon(
                                Icons.star,
                                color: Color(0xffac6e74),
                                size: 16,
                              ),
                              RichText(
                                  text: const TextSpan(
                                      text:  '4.3',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 13),
                                      children: [
                                  ])),
                            ],
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            widget.shopname ?? "Manyawar",
                            style: const TextStyle(
                                fontSize: 13,
                                color: Color(0xFFBDBDBD),
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 1.h,
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 15, right: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                widget.productprice ?? "₹23,499 onwards",
                                style: const TextStyle(
                                    color: Color(0xffac6e74),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                              ),
                              Spacer(),
                              const Icon(
                                Icons.reply,
                                color: Color(0xffac6e74),
                                size: 20,
                              ),
                              const Text("Share", style: TextStyle(fontSize: 16)),
                            ],
                          ),
                          SizedBox(
                            height: 2.7.h,
                          ),
                          Row(
                            children: [
                              const CircleAvatar(
                                backgroundColor: Color(0xffac6e74),
                                radius: 25.5,
                                child: CircleAvatar(
                                    backgroundColor: Color(0xFFF5F5F5),
                                    // set the background color for the CircleAvatar
                                    radius: 25,
                                    // set the radius for the CircleAvatar
                                    child: Icon(Icons.bookmark,
                                        size: 20,
                                        color: Color(
                                            0xffac6e74)) // set the width for the border
                                    ),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SendMessage()));
                                },
                                child: Container(
                                  width: 300,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFF5F5F5),
                                      borderRadius: BorderRadius.circular(60),
                                      border: Border.all(
                                          width: 0.5,
                                          color: const Color(0xffac6e74))),
                                  child: ListTile(
                                      title: Container(
                                          margin: const EdgeInsets.only(
                                              left: 68, bottom: 10),
                                          child: const Icon(
                                            Icons.message,
                                            color: Color(0xffac6e74),
                                            size: 18,
                                          )),
                                      trailing: Container(
                                        height: 60,
                                        width: 150,
                                        margin: const EdgeInsets.only(
                                            right: 25, top: 12),
                                        child: const Text(
                                          "Send Message",
                                          style: TextStyle(
                                              color: Color(0xffac6e74),
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15),
                                        ),
                                      )),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 1.3.h,
                          ),
                          Text(
                            "About",
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Poppins',
                                color: Color(0xFFBDBDBD),
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Container(
                            width: 100.w,
                            child: Text(
                               widget.productDisp ?? 'Exquisite floral embroidery in subdued gold enriches the lustrous silk fabric of this rani pink floral embroidered bridal lehenga. The wedding ensemble features heavy needle work on the plunge neck princess cut strappy blouse and kali cut skirt. The matching dupatta is bordered with floral vines and a scalloped outline to complement the skirt. The outfit equipped with a decorated drawstring and a stunning waist belt is perfect for glorious wedding ceremonies throughout the year. Accessorise this lehenga with golden heels and kundan jewellery.',
                              style: TextStyle(
                                fontSize: 14,
                                letterSpacing: 0.7,
                                height: 1.5,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            "More photos",
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Poppins',
                                color: Color(0xFFBDBDBD),
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 2.w),
                            width: 500.w,
                            height: 60.w,
                            child: Expanded(
                                child: ScrollConfiguration(
                                  behavior: const ScrollBehavior(),
                                  child: GlowingOverscrollIndicator(
                                    axisDirection: AxisDirection.up,
                                    color: Colors.black,
                                    child: ListView.builder(
                                        itemCount: widget.productsImglist!.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (BuildContext context, int index) {
                                          return Container(
                                            margin: const EdgeInsets.only(right: 15),
                                            width: 50.w,
                                            height: 40.w,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                image: DecorationImage(
                                                    image: NetworkImage(widget.productsImglist![index]),
                                                    fit: BoxFit.cover)),
                                          );
                                        }),
                                  ),
                                )),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
