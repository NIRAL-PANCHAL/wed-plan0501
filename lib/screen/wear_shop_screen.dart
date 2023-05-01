import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner_project/screen/seller_near_you_screen.dart';
import '../networking/models/response/category_response_model.dart';
import 'cart_screen.dart';

class WearShopSceen extends StatefulWidget {
  String? categorynames;
  List<Multipleshop>? categoriesdetails;
   WearShopSceen({Key? key, this.categoriesdetails, this.categorynames}) : super(key: key);

  @override
  State<WearShopSceen> createState() => _WearShopSceenState();
}

class _WearShopSceenState extends State<WearShopSceen> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  GlobalKey<RefreshIndicatorState>();
  int _itemCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: 100.w,
            height: 100.h,
            child: Column(
              children: [
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  padding: EdgeInsets.only(top: 15),
                  width: 100.w,
                  height: 50,
                  child: Row(
                    children: [
                      Spacer(),
                      Stack(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.shopping_cart,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CartScreen()));
                            },
                          ),
                          _itemCount > 0
                              ? Positioned(
                            right: 5,
                            child: Container(
                              padding: EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              constraints: BoxConstraints(
                                minWidth: 15,
                                minHeight: 15,
                              ),
                              child: Text(
                                '$_itemCount',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                              : Container(),
                        ],
                      ),
                    ],
                  ),
                ),
                Center(
                    child: Text(
                        widget.categorynames!.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 35,
                          color: Colors.white),
                    ))
              ],
            ),
            color: const Color(0xffac6e74),
          ),
          Container(
            margin: EdgeInsets.only(top: 15.h),
            width: 100.w,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius:
                BorderRadius.vertical(top: Radius.circular(30))),
            child: Container(
              margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
              color: Colors.transparent,
              width: 100.w,

              child: RefreshIndicator(
                key: _refreshIndicatorKey,
                color: Colors.white,
                backgroundColor: const Color(0xffac6e74),
                strokeWidth: 2.0,
                onRefresh: () async {
                  return Future<void>.delayed(const Duration(seconds: 2));
                },
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: widget.categoriesdetails!.length,
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                        onTap :(){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TopWearImages(
                                  productname:
                                  widget.categoriesdetails![index].wearname.toString(),
                                  productimage: widget.categoriesdetails![index].wearimg.toString(),
                                  productDisp: widget.categoriesdetails![index].wearDispriction.toString(),
                                  productprice: widget.categoriesdetails![index].wearPrice.toString(),
                                  productsImglist: widget.categoriesdetails![index].multiplePhotos,
                                )),
                          );
                        },
                        child :Stack(
                          fit: StackFit.expand,
                          children: [
                            GestureDetector(
                              child: Container(
                                width: 120,
                                height: 150,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                        image: NetworkImage(widget.categoriesdetails![index].wearimg.toString()),
                                        fit: BoxFit.cover)),
                              ),
                            ),
                            Container(
                              width: 120,
                              height: 180,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Colors.white, Colors.white10],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.center,
                                ),
                              ),
                            ),
                            Positioned(
                                top: 2,
                                right: 1,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CartScreen()));
                                  },
                                  child: Container(
                                      child: const CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 15,
                                          child: Icon(
                                            Icons.shopping_cart,
                                            color: Color(0xffac6e74),
                                          ))),
                                )),
                            Positioned(
                                bottom: 8,
                                left: 5,
                                child: Container(
                                  child: Text(
                                      widget.categoriesdetails![index].wearPrice.toString(),
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xffac6e74))),
                                )),
                            Positioned(
                                bottom: 20,
                                left: 5,
                                child: Container(
                                  child: Text(
                                      widget.categoriesdetails![index].wearname.toString(),
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500)),
                                ))
                          ],
                        )

                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
