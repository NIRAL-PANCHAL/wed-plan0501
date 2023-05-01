import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner_project/screen/venueInfo_screen.dart';

import '../networking/models/response/vendor_response_model.dart';

class placeInfo {
  String? placeName;
  String? placeLocation;
  String? placeImage;
  String? placePrice;
  String? placeReview;

  placeInfo(
      {this.placeImage,
      this.placeLocation,
      this.placePrice,
      this.placeName,
      this.placeReview});
}

class VanueDetails extends StatefulWidget {
  String? appbartitle;
  List<VendorsDetail>? venuepic;

  VanueDetails({Key? key, this.appbartitle, this.venuepic}) : super(key: key);

  @override
  State<VanueDetails> createState() => _VanueDetailsState();
}

class _VanueDetailsState extends State<VanueDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          leading: BackButton(
            color: Colors.black,
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            Row(
              children: [
                Container(
                  width: 10,
                  height: 30,
                  color: Colors.transparent,
                  child: IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.search,
                      color: Color(0xffac6e74),
                      size: 20,
                    ),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Container(
                  margin: EdgeInsets.only(right: 20),
                  width: 20,
                  height: 30,
                  color: Colors.transparent,
                  child: IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.bookmark,
                      color: Color(0xffac6e74),
                      size: 20,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            )
          ],
          title: Text(
            widget.appbartitle.toString(),
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w700, fontSize: 23),
          ),
        ),
        body: Container(
            margin: EdgeInsets.only(left: 3.w, top: 1.w,right: 1.w),
            child: Column(children: [
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: widget.venuepic!.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                      thickness: 0.5,
                      indent: 2,
                      endIndent: 2,
                    );
                  },
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VenueInfo(
                                      venuePlace: widget
                                          .venuepic![index].hotelImage
                                          .toString(),
                                      venuePrice: widget.venuepic![index].price
                                          .toString(),
                                      venueLocation: widget
                                          .venuepic![index].address
                                          .toString(),
                                      venueName: widget
                                          .venuepic![index].hotelname
                                          .toString(),
                                      latitude : widget.venuepic![index].latitude,
                                      longitude: widget.venuepic![index].longitude,
                                    )));
                      },
                      child: Row(
                        children: [
                          Container(
                            width: 45.w,
                            height: 30.w,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(widget
                                        .venuepic![index].hotelImage
                                        .toString()),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          Container(
                            margin: EdgeInsets.only( top: 3.w),
                            width: 48.w,
                            height: 35.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 1.w,
                                ),
                                Text(
                                    widget.venuepic![index].hotelname
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w600)),
                                SizedBox(
                                  height: 1.w,
                                ),
                                Container(
                                  width: 44.w,
                                  child: Text(
                                    widget.venuepic![index].address.toString(),
                                    maxLines: 2,
                                    style: TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: 12.sp,
                                        color: Color(0xFFBDBDBD),
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                SizedBox(
                                  height: 3.w,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Color(0xffac6e74),
                                      size: 16,
                                    ),
                                    RichText(
                                        text: TextSpan(
                                            text: '4.3',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 13),
                                            children: [
                                          TextSpan(
                                              text: '  (198)',
                                              style: TextStyle(
                                                color: Color(0xFFBDBDBD),
                                                fontSize: 10,
                                                fontWeight: FontWeight.w400,
                                              )),
                                        ])),
                                  ],
                                ),
                                SizedBox(
                                  height: 1.w,
                                ),
                                Text(
                                  widget.venuepic![index].price.toString(),
                                  style: TextStyle(
                                    color: Color(0xffac6e74),
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ])));
  }
}
