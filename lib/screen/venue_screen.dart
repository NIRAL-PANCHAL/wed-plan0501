import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner_project/networking/Bloc/hotelBloc.dart';
import 'package:wedding_planner_project/screen/search_screen.dart';
import 'package:wedding_planner_project/screen/vendors_page.dart';

import '../networking/models/response/hotel_list_reponse_model.dart';
import '../networking/response.dart';
import 'account_screen.dart';

class StoryInfo {
  String? storyImage;
  String? userName;

  StoryInfo({this.storyImage, this.userName});
}

class VenueInfo {
  String? venueImage;
  String? venueName;
  String? venueLocation;
  String? venuePrice;

  VenueInfo(
      {this.venueImage, this.venueName, this.venuePrice, this.venueLocation});
}

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late HotelBloc hotelBloc;
  List<Datum> HotelDataList = [];
  @override
  void initState() {
    super.initState();
    hotelBloc = HotelBloc();
    hotelBloc.Hotel();
    hotelBloc.HotelStream.listen((event) {
      switch (event.status) {
        case Status.LOADING:
          break;
        case Status.COMPLETED:
          setState(() {
            HotelDataList = event.data!.data!;
          });
          break;
        case Status.ERROR:
          break;
      }
    });
  }

  List<String> images = [
    'https://assets.vogue.in/photos/60e4369f96d470590e0c7e7a/2:3/w_1600,c_limit/CNI%20x%20Marriott%20Mussorie%20Photos-4.jpg',
    'https://img.freepik.com/free-photo/wedding-couple-france_1303-5588.jpg?w=2000',
    'https://t4.ftcdn.net/jpg/03/21/68/65/360_F_321686562_Op6T1XRYVnzXCthSd5ifzBC2LXzHxKjB.jpg',
    'https://www.weddingforward.com/wp-content/uploads/2020/01/rustic-wedding-d%C3%A9cor-featured-anya-kernes-photography.jpg',
    'https://www.brides.com/thmb/YmbgQGVP72ox-iL3wARX2BvY6Kc=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/__opt__aboutcom__coeus__resources__content_migration__brides__proteus__5bb64a4ab2e7ef506361bb51__11-57fb9d6a4fbb4a43a0cad00bcc7fb6c9.jpeg',
    'https://c4.wallpaperflare.com/wallpaper/167/626/481/couple-dance-flamenco-red-wallpaper-preview.jpg',
    'https://i.pinimg.com/736x/e8/c0/21/e8c021e9276e8f5311ce3ea9cab34527.jpg',
  ];
  List<String> servicelist = [
    "Venue",
    "Photographer",
    "Makeup",
    "Decor",
    "Catering",
    "Music & Dance",
    "Invitation & Gift",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Container(
          margin: EdgeInsets.only(left: 5),
          child: Text("Venues",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Color(0xffac6e74))),
        ),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              padding: const EdgeInsets.all(8),
              primary: Colors.transparent,
            ),
            onPressed: () {},
            child: Container(
              margin: EdgeInsets.only(left: 20),
              width: 20,
              height: 30,
              color: Colors.transparent,
              child: IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.chat,
                  color: Color(0xffac6e74),
                  size: 20,
                ),
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              padding: const EdgeInsets.all(8),
              primary: Colors.transparent,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                  builder: (context) => AccountDetails()));
            },
            child: Container(
              margin: EdgeInsets.only(right: 20),
              width: 20,
              height: 30,
              color: Colors.transparent,
              child: IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.person,
                  color: Color(0xffac6e74),
                  size: 20,
                ),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 3.w, right: 3.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Text("Hey Niral,\nWhat're you looking for?",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchScrreen()));
                    },
                    child: Icon(Icons.search_sharp,
                        size: 20, color: Color(0xffac6e74)),
                    style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(20),
                        backgroundColor: Color(0xFFE0E0E0),
                        elevation: 0 // <-- Button color
                        // <-- Splash color
                        ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)
                  =>
                      VendorsScreen())
                  ,
                  );
                },
                child: Container(
                  color: Colors.transparent,
                  width: 500,
                  height: 380,
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: images.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return Stack(
                        fit: StackFit.expand,
                        children: [
                          Container(
                            width: 120,
                            height: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                    image: NetworkImage(images[index]),
                                    fit: BoxFit.cover)),
                          ),
                          Container(
                            width: 120,
                            height: 150,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              gradient: LinearGradient(
                                colors: [Colors.white, Colors.white10],
                                begin: Alignment.bottomCenter,
                                end: Alignment.center,
                              ),
                            ),
                          ),
                          Positioned(
                              bottom: 5,
                              left: 5,
                              child: Container(
                                child: Text(servicelist[index].toString(),
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500)),
                              ))
                        ],
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Popular Venue For You!",
                style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFFBDBDBD),
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 65.w,
                child: ListView.builder(
                  itemCount: HotelDataList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: 65.w,
                                  height: 45.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                          image: NetworkImage(HotelDataList[index].hotelImage
                                              .toString()),
                                          fit: BoxFit.cover)),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => VendorsScreen(
                                          /*  venueimage: venueList[index]
                                                .venueImage
                                                .toString(),
                                            venuename: venueList[index]
                                                .venueName
                                                .toString(),
                                            venuelocation: venueList[index]
                                                .venueLocation
                                                .toString(),*/
                                          )),
                                    );
                                  },
                                  child: Container(
                                    width: 65.w,
                                    height: 45.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: LinearGradient(
                                        colors: [Colors.white, Colors.white10],
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.center,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                    bottom: 10,
                                    left: 15,
                                    child: Container(
                                      child: Text(
                                          HotelDataList[index].hotelname.toString(),
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500)),
                                    ))
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 250,
                              child: Text(
                                HotelDataList[index].address.toString(),
                                style: TextStyle(
                                    fontSize: 16,
                                    overflow: TextOverflow.ellipsis,
                                    color: Color(0xFFBDBDBD),
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 115),
                              child: Text(
                                HotelDataList[index].price.toString(),
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xffac6e74),
                                    fontWeight: FontWeight.w500),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        )
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
