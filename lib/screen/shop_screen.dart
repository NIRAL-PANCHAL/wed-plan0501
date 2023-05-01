import 'package:blinking_text/blinking_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner_project/screen/place_photos_screen.dart';
import 'package:wedding_planner_project/screen/search_screen.dart';
import 'package:wedding_planner_project/screen/seller_near_you_screen.dart';
import 'package:wedding_planner_project/screen/vendors_page.dart';
import 'package:wedding_planner_project/screen/wear_shop_screen.dart';

import '../networking/Bloc/CategoryBloc.dart';
import '../networking/models/response/category_response_model.dart';
import '../networking/response.dart';
import 'account_screen.dart';
import 'offers_screen.dart';

class VenueInfo {
  String? ProductImage;
  String? Productname;
  String? shopName;
  String? ProductPrice;

  VenueInfo(
      {this.ProductImage, this.Productname, this.ProductPrice, this.shopName});
}

class ShopScreen extends StatefulWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  List<String> images = [
    'https://i.pinimg.com/736x/06/23/6c/06236c69205198304e376731cd4ee839.jpg',
    'https://getethnic.com/wp-content/uploads/2020/07/178856884_461462455161972_5645477045751259628_n.jpg ',
    'https://shaadiwish.com/blog/wp-content/uploads/2021/01/bridal-jewellery-sets-819x1024.jpg',
    'https://i.pinimg.com/originals/61/1c/8c/611c8c8e2ccc8f63d2209027986b7df5.jpg',
    'https://m.media-amazon.com/images/I/A1SfHpJv13L._SL1500_.jpg',
  ];
  List<String> servicelist = [
    "Bride Wear",
    "Groom Wear",
    "Jewellery",
    "Acessories",
    "Invitation & Gift",
  ];
  List<VenueInfo> shopList = [
    VenueInfo(
        ProductImage:
            "https://cdn0.weddingwire.in/article/9874/original/1280/jpg/94789-wedding-dresse-for-girls-weddingnama-latest-weddingweddingdressesforgirls-.jpeg",
        shopName: "Pernia's Bridal Shop",
        Productname: "Red-Authentic lehngha",
        ProductPrice: "₹22,000 onwards"),
    VenueInfo(
        ProductImage:
            "https://i.pinimg.com/736x/6e/41/64/6e4164b6fe558039de8f955d114027b4.jpg",
        shopName: "Zuria Dior",
        Productname: "Silver printed full-outfit",
        ProductPrice: "₹15,000 onwards"),
    VenueInfo(
        ProductImage:
            "https://cdn0.weddingwire.in/article/1354/original/1280/jpg/94531-indian-wedding-dress-for-groom-in-summer-manish-malhotra-lilac-sherwani-for-summer-wedding.jpeg",
        shopName: "Manyavar",
        Productname: "Light-pink printed kurta",
        ProductPrice: "₹6,800 onwards"),
    VenueInfo(
        ProductImage:
            "https://newcdn.kalkifashion.com/media/catalog/product/c/r/cream_sherwani_with_detailed_resham-sg106900_2_.jpg",
        shopName: "Sabyasachi",
        Productname: "pink Shervani",
        ProductPrice: "₹39,000 onwards"),
  ];
  late CategoryBloc categoryBloc;
  List<CategoryDetail> CategoryDatalist = [];
  @override
  void initState() {
    super.initState();
    categoryBloc = CategoryBloc();
    categoryBloc.Category();
    categoryBloc.CategoryStream.listen((event) {
      switch (event.status) {
        case Status.LOADING:
          break;
        case Status.COMPLETED:
          setState(() {
            CategoryDatalist = event.data.categoryDetails;
          });
          break;
        case Status.ERROR:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Container(
          margin: const EdgeInsets.only(left: 5),
          child: const Text("Shop",
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
              margin: const EdgeInsets.only(left: 20),
              width: 20,
              height: 30,
              color: Colors.transparent,
              child: const IconButton(
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AccountDetails()));
            },
            child: Container(
              margin: const EdgeInsets.only(right: 20),
              width: 20,
              height: 30,
              color: Colors.transparent,
              child: const IconButton(
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
      body: Container(
        margin: const EdgeInsets.only(left: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            margin: EdgeInsets.only(right: 5.w),
            child: Row(
              children: [
                 Text("Hey Niral,\nChat & buy direct from seller.",
                    style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500)),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SearchScrreen()));
                  },
                  child: const Icon(Icons.search_sharp,
                      size: 20, color: Color(0xffac6e74)),
                  style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(20),
                      backgroundColor: const Color(0xFFE0E0E0),
                      elevation: 0 // <-- Button color
                      // <-- Splash color
                      ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30),
            height: 150,
            child: ScrollConfiguration(
              behavior: const ScrollBehavior(),
              child: GlowingOverscrollIndicator(
                axisDirection: AxisDirection.down,
                color: Colors.white,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: CategoryDatalist.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                          context,
                          MaterialPageRoute(
                          builder: (context) =>WearShopSceen(
                              categorynames : CategoryDatalist[index].category.toString(),
                            categoriesdetails: CategoryDatalist[index].multipleshop,
                          )));
                          /*Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TopWearImages(
                                      productname:
                                          servicelist[index].toString(),
                                      productimage: images[index].toString(),
                                    )),
                          );*/
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 20),
                          color: Colors.transparent,
                          width: 150,
                          height: 150,
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Container(
                                width: 120,
                                height: 150,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            CategoryDatalist[index].categoryImage.toString()),
                                        fit: BoxFit.cover)),
                              ),
                              Container(
                                width: 120,
                                height: 150,
                                decoration: const BoxDecoration(
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
                                  left: 10,
                                  child: Container(
                                    child: Text(CategoryDatalist[index].category.toString(),
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500)),
                                  ))
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          const Text(
            "Wedding Shopping",
            style: TextStyle(
                fontSize: 20,
                color: Color(0xFFBDBDBD),
                fontWeight: FontWeight.w700),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OfferScreen()),
              );
            },
            child: Stack(
              children: [
                Container(
                  height: 13.h,
                  child: Container(
                      margin: const EdgeInsets.only(top: 22),
                      width: 100.w,
                      decoration: BoxDecoration(
                        color: const Color(0xFFEEEEEE),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        margin: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Grab your offers  ',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                ),
                                BlinkText(
                                  '50% - 70% Off.',
                                  beginColor: Color(0xffac6e74),
                                  endColor: Color(0xffac6e74),
                                  times: 1,
                                  duration: Duration(milliseconds: 500),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 0.3.h,
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Visit end of Season Sale🎉",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0xFFBDBDBD),
                                      fontWeight: FontWeight.w700),
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios_sharp,
                                  size: 16,
                                  color: Color(0xFFBDBDBD),
                                )
                              ],
                            ),
                          ],
                        ),
                      )),
                ),
                Positioned(
                    left: 63.w,
                    child: Container(
                      width: 40.w,
                      height: 15.h,
                      child: Image.asset(
                          "assets/pngtree-indian-wedding-couple-outfits-traditional-lehenga-and-indo-western-for-bride-png-image_7650932-removebg.png"),
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          const Text(
            "Seller Near you",
            style: TextStyle(
                fontSize: 20,
                color: Color(0xFFBDBDBD),
                fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 2.h,
          ),
          Expanded(
              child: ScrollConfiguration(
            behavior: const ScrollBehavior(),
            child: GlowingOverscrollIndicator(
              axisDirection: AxisDirection.up,
              color: Colors.black,
              child: ListView.builder(
                  itemCount: shopList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TopWearImages(
                                  productname:
                                      shopList[index].Productname.toString(),
                                  productimage:
                                      shopList[index].ProductImage.toString(),
                                  shopname: shopList[index].shopName.toString(),
                                  productprice:
                                      shopList[index].ProductPrice.toString())),
                        );
                      },
                      child: Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 15),
                            width: 50.w,
                            height: 30.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: NetworkImage(shopList[index]
                                        .ProductImage
                                        .toString()),
                                    fit: BoxFit.cover)),
                          ),
                          Container(
                            width: 50.w,
                            height: 30.h,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.white, Colors.white10],
                                begin: Alignment.bottomCenter,
                                end: Alignment.center,
                              ),
                            ),
                          ),
                          Positioned(
                              bottom: 4.5.h,
                              left: 1.h,
                              child: Container(
                                child: Text(
                                    shopList[index].Productname.toString(),
                                    style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500)),
                              )),
                          Positioned(
                              left: 1.h,
                              bottom: 2.3.h,
                              child: Container(
                                child: Text(shopList[index].shopName.toString(),
                                    style: const TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFFBDBDBD),
                                        //0xffac6e74,
                                        fontWeight: FontWeight.w500)),
                              )),
                          Positioned(
                              left: 1.h,
                              bottom: 0.5.h,
                              child:
                                  Text(shopList[index].ProductPrice.toString(),
                                      style: const TextStyle(
                                          fontSize: 14,
                                          color: Color(0xffac6e74),
                                          //0xffac6e74,
                                          fontWeight: FontWeight.w500))),
                        ],
                      ),
                    );
                  }),
            ),
          ))
        ]),
      ),
    );
  }
}
