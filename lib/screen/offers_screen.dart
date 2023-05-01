import 'package:blinking_text/blinking_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wedding_planner_project/screen/productList_screen.dart';


class OfferScreen extends StatefulWidget {
  const OfferScreen({Key? key}) : super(key: key);

  @override
  State<OfferScreen> createState() => _OfferScreenState();
}


class _OfferScreenState extends State<OfferScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  List<String> images = [
    'https://cdn0.weddingwire.in/article/5810/original/1280/jpg/50185-black-kurta-pajama-tarun-tahiliani-1-the-black-velvet-overcoat.jpeg',
    'https://royalanarkali.com/wp-content/uploads/2020/09/fiona-standard-green-georgette-with-embroidery-work-lehenga-salwar-suit.jpg',
    'https://m.media-amazon.com/images/I/71G8hgm23YL._UX679_.jpg',
    'https://images.shaadisaga.com/shaadisaga_production/photos/pictures/000/376/322/original/simoz.jpg?1522244809  ',
    'https://www.pinitup.co.in/wp-content/uploads/2021/02/Custom-Brooches-for-Men-1.jpg',
    'https://cdn.venuemonk.com/wp-content/uploads/2021/01/Floral-safa-Delhi-Velvet-819x1024.jpeg',
    'https://image.wedmegood.com/resized-nw/700X/wp-content/uploads/2020/07/232495035_223812832847088_3190854594765155875_n.jpg',
  ];
  List<String> servicelist = [
    "Kurtas & Payjama",
    "Lehngha & Salvar",
    "Jodhpuri",
    "Juti",
    "Brooch",
    "Safa",
    "Odhani",
  ];
  final List<Widget> _images = [
    Image.network(
      "https://img.freepik.com/premium-vector/summer-sale-poster-design-with-50-discount-offer-ice-cream-stick-pink-background_1302-26355.jpg?w=2000",
      fit: BoxFit.cover,
    ),
    Image.network(
      "https://manyavar.scene7.com/is/image/manyavarstage/Mohey%20Banner%20Dektop%20jpg_11-11-2022-04-58?\$R%2DD%2DHP%2DMB\$",
      fit: BoxFit.cover,
    ),
    Image.network(
      "https://manyavar.scene7.com/is/image/manyavarstage/Taiyari_Desktop%20jpg_09-11-2022-09-29?\$R%2DD%2DHP%2DB\$",
      fit: BoxFit.cover,
    ),
    Image.network(
        "https://manyavar.scene7.com/is/image/manyavarstage/Store%20Creative%20jpg_11-11-2022-07-30?\$R%2DD%2DHP%2DSB\$",
        fit: BoxFit.cover)
  ];
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  GlobalKey<RefreshIndicatorState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Stack(
        children: [
          Container(
              width: 100.w,
              height: 300.h,
              color: Color(0xffac6e74),
              child: Stack(
                children: [
                  Container(
                    width: 100.w,
                    height: 33.h,
                    child: CarouselSlider(
                      options: CarouselOptions(
                        height: 33.h,
                        autoPlay: true,
                        scrollPhysics: BouncingScrollPhysics(),
                        enlargeCenterPage: true,
                        aspectRatio: 20,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        viewportFraction: 1.0,
                      ),
                      items: _images,
                    ),
                  ),
                ],
              )),
          Positioned(
              bottom: 0.h,
              child: Container(
                width: 100.w,
                height: 68.h,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30))),
                child: Container(
                  margin: EdgeInsets.only(left: 15, right: 15,top: 15),
                  color: Colors.transparent,
                  width: 500,
                  height: 380,
                  child: RefreshIndicator(
                    key: _refreshIndicatorKey,
                    color: Colors.white,
                    backgroundColor: Color(0xffac6e74),
                    strokeWidth: 2.0,
                    onRefresh: () async {
                      return Future<void>.delayed(const Duration(seconds: 2));
                    },
                    child: GridView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: images.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetails()));
                          },
                          child: Stack(
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
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ))
        ],
      ),
    ));
  }
}
