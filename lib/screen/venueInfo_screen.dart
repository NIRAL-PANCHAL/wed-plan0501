import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:wedding_planner_project/screen/map_utils.dart';
import 'package:wedding_planner_project/screen/place_photos_screen.dart';
import 'package:wedding_planner_project/screen/send_message.dart';

import '../networking/models/response/vendor_response_model.dart';

class VenueInfo extends StatefulWidget {
  String? venuePlace;
  String? venuePrice;
  String? venueLocation;
  String? venueName;
  double? latitude;
  double? longitude;

  VenueInfo(
  {Key? key,
  required this.venuePlace,
      required this.venuePrice,
      required this.venueLocation,
      required this.venueName,
  this.longitude,
  this.latitude})
      : super(key: key);

  @override
  State<VenueInfo> createState() => _VenueInfoState();
}

class _VenueInfoState extends State<VenueInfo> {
  List<String> images = [
    'https://cdn0.weddingwire.ca/vendor/1511/original/960/jpg/emily-derek-wedding-ryan-bolton-0h3a1735_50_1511-157773453382793.webp',
    'https://i.pinimg.com/736x/fd/52/0e/fd520e0e4547aec9eadf3bc75ac74758.jpg',
    'https://asset1.zankyou.com/images/mag-post/3ec/9014/685//-/uk/wp-content/uploads/2018/05/guests-drinks-wedding-reception.jpg',
    'https://www.gksconventions.com/wp-content/uploads/2022/08/biggest-marriage-hall.jpg',
    'https://media.weddingz.in/images/1f03a66c7add9e61422d0d1203aeb083/best-wedding-reception-halls-in-patna-you-will-absolutely-fall-in-love-with.jpg',
    'https://www.trulyengaging.com/resources/golfcourse/Golf-Course-Wedding-MissionInn1.jpg',
    'https://shaadiwish.com/blog/wp-content/uploads/2017/10/2b-1.jpg',
  ];
  List<String> servicelist = [
    "Main Hall",
    "Dining Hall",
    "Garden",
    "Confernce Hall",
    "Banquet hall",
    "Golf Courses",
    "Palace & Forts",
  ];
  List<String> photosList = [
    "24 photos",
    "16 photos",
    "9 photos",
    "13 photos",
    "8 photos",
    "21 photos",
    "11 photos",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  widget.venuePlace.toString(),
                  width: 100.w,
                  height: 30.h,
                  fit: BoxFit.cover,
                ),
              ),
              pinned: true,
              expandedHeight: MediaQuery.of(context).size.height * 0.305,
            ),
            SliverList(delegate: SliverChildListDelegate([
              Container(
                margin: const EdgeInsets.only(left: 2),
                width: 100.w,
                height: 300.w,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30),
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text(
                        widget.venueName.toString(),
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(
                        widget.venueLocation.toString(),
                        style: const TextStyle(
                            fontSize: 13,
                            color: Color(0xFFBDBDBD),
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 15, right: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Color(0xffac6e74),
                                size: 13,
                              ),
                              RichText(
                                  text: const TextSpan(
                                      text: '4.3',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 10),
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
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                widget.venuePrice.toString(),
                                style: const TextStyle(
                                    color: Color(0xffac6e74),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: (){
                                  openMap('${Uri.parse('https://www.google.com/maps/search/?api=1&query=${widget.latitude!.toDouble()},${widget.longitude!.toDouble()}')}');
                                },
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.map,
                                      color: Color(0xffac6e74),
                                      size: 16,
                                    ),
                                    GestureDetector(
                                      child: const Text(
                                        "View in map",
                                        style: TextStyle(fontSize: 13),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              GestureDetector(
                                onTap: ()async{
                                  final venuePreview = widget.venuePlace;
                                  final url = Uri.parse('${Uri.parse('https://www.google.com/maps/search/?api=1&query=${widget.latitude!.toDouble()},${widget.longitude!.toDouble()}')}');
                                  final venuename = widget.venueName;
                                  await Share.share("$url\n$venuename\n\n\b--WedPlanner Application❤");
                                },
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.reply,
                                      color: Color(0xffac6e74),
                                      size: 16,
                                    ),
                                    const Text("Share",
                                        style: TextStyle(fontSize: 13)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
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
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SendMessage()));
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
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 15),
                      child: const Text(
                        "Area available",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      thickness: 0.5,
                      indent: 15,
                      endIndent: 15,
                    ),
                    Container(
                      margin:  EdgeInsets.only(left: 15, right: 5.w),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                "Main Hall",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                "800 seating    |   1000  pax.",
                                style: TextStyle(
                                    fontSize: 11,
                                    color: Color(0xFFBDBDBD),
                                    fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Dining Area",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                "500 seating   |   800 pax.",
                                style: TextStyle(
                                    fontSize: 11,
                                    color: Color(0xFFBDBDBD),
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                         Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Conference Hall",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "100 seating   |   120 pax.",
                                style: TextStyle(
                                    fontSize: 11,
                                    color: Color(0xFFBDBDBD),
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Garden",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "1200 seating   |   1500 pax.",
                                style: TextStyle(
                                    fontSize: 11,
                                    color: Color(0xFFBDBDBD),
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Divider(
                      thickness: 0.5,
                      indent: 15,
                      endIndent: 15,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 15),
                      child: const Text(
                        "Portfolio",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Expanded(
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: false,
                        itemCount: images.length,
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PlacePhotosScreen(
                                      placeName:
                                      servicelist[index].toString(),
                                    )),
                              );
                            },
                            child: Stack(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                      left: 15, right: 15),
                                  width: 100.w,
                                  height: 17.5.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: NetworkImage(images[index]),
                                          fit: BoxFit.cover)),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                      left: 15, right: 15),
                                  width: 100.w,
                                  height: 17.5.h,
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [Colors.white, Colors.white10],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.center,
                                    ),
                                  ),
                                ),
                                Positioned(
                                    top: 20.h,
                                    left: 6.w,
                                    child: Container(
                                      child: Text(photosList[index].toString(),
                                          style: const TextStyle(
                                              fontSize: 14,
                                              color: Color(0xFFBDBDBD),
                                              fontWeight: FontWeight.w500)),
                                    )),
                                Positioned(
                                    top: 18.h,
                                    left: 6.w,
                                    child: Container(
                                      child: Text(servicelist[index].toString(),
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500)),
                                    )),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )
            ]))
          ],
        )
    );

  }

  void openMap(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
