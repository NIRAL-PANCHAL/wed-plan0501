import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sizer/sizer.dart';

class Imagelist {
  String? imagepic;
  bool? isSelected = false;

  Imagelist({this.imagepic, this.isSelected});
}

class PlacePhotosScreen extends StatefulWidget {
  String? placeName;

  PlacePhotosScreen({Key? key, required this.placeName}) : super(key: key);

  @override
  State<PlacePhotosScreen> createState() => _PlacePhotosScreenState();
}

class _PlacePhotosScreenState extends State<PlacePhotosScreen> {
  bool likeButton = true;
  List<Imagelist> images = [
    Imagelist(
      imagepic:
          'https://cdn0.weddingwire.ca/vendor/1511/original/960/jpg/emily-derek-wedding-ryan-bolton-0h3a1735_50_1511-157773453382793.webp',
      isSelected: false,
    ),
    Imagelist(
      imagepic:
          'https://i.pinimg.com/736x/fd/52/0e/fd520e0e4547aec9eadf3bc75ac74758.jpg',
      isSelected: false,
    ),
    Imagelist(
      imagepic:
          'https://asset1.zankyou.com/images/mag-post/3ec/9014/685//-/uk/wp-content/uploads/2018/05/guests-drinks-wedding-reception.jpg',
      isSelected: false,
    ),
    Imagelist(
      imagepic:
          'https://www.gksconventions.com/wp-content/uploads/2022/08/biggest-marriage-hall.jpg',
      isSelected: false,
    ),
    Imagelist(
      imagepic:
          'https://media.weddingz.in/images/1f03a66c7add9e61422d0d1203aeb083/best-wedding-reception-halls-in-patna-you-will-absolutely-fall-in-love-with.jpg',
      isSelected: false,
    ),
    Imagelist(
      imagepic:
          'https://www.trulyengaging.com/resources/golfcourse/Golf-Course-Wedding-MissionInn1.jpg',
      isSelected: false,
    ),
    Imagelist(
      imagepic:
          'https://shaadiwish.com/blog/wp-content/uploads/2017/10/2b-1.jpg',
      isSelected: false,
    ),
    Imagelist(
      imagepic:
          'https://cdn0.weddingwire.ca/vendor/1511/original/960/jpg/emily-derek-wedding-ryan-bolton-0h3a1735_50_1511-157773453382793.webp',
      isSelected: false,
    ),
    Imagelist(
      imagepic:
          'https://i.pinimg.com/736x/fd/52/0e/fd520e0e4547aec9eadf3bc75ac74758.jpg',
      isSelected: false,
    ),
    Imagelist(
      imagepic:
          'https://asset1.zankyou.com/images/mag-post/3ec/9014/685//-/uk/wp-content/uploads/2018/05/guests-drinks-wedding-reception.jpg',
      isSelected: false,
    ),
    Imagelist(
      imagepic:
          'https://www.gksconventions.com/wp-content/uploads/2022/08/biggest-marriage-hall.jpg',
      isSelected: false,
    ),
    Imagelist(
      imagepic:
          'https://www.trulyengaging.com/resources/golfcourse/Golf-Course-Wedding-MissionInn1.jpg',
      isSelected: false,
    ),
    Imagelist(
      imagepic:
          'https://www.gksconventions.com/wp-content/uploads/2022/08/biggest-marriage-hall.jpg',
      isSelected: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: BackButton(
          color: Colors.black,
        ),
        title: Row(
          children: [
            SizedBox(
              width: 19.w,
            ),
            Icon(
              Icons.photo_library,
              color: Color(0xffac6e74),
            ),
            SizedBox(width: 2.w),
            Text(
              widget.placeName.toString(),
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: StaggeredGrid.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                axisDirection: AxisDirection.down,
                children: images.map((e) {
                  return Stack(
                    children: [
                      GestureDetector(
                        onDoubleTap: () {
                          setState(() {
                            e.isSelected = !e.isSelected!;
                          });
                        },
                        child: Image.network(
                          fit: BoxFit.cover,
                          e.imagepic.toString(),
                        ),
                      ),
                      Positioned(
                          child: InkWell(
                        onTap: () {
                          setState(() {
                            e.isSelected = !e.isSelected!;
                          });
                        },
                        child: Icon(
                          e.isSelected == true
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: e.isSelected == true ? Colors.red : Colors.white,
                          size: 20,
                        ),
                      ))
                    ],
                  );
                }).toList()),
          )),
        ],
      ),
    );
  }
}
