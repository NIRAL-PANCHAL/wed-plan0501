import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../networking/Bloc/productBloc.dart';
import '../networking/models/response/productlist_model.dart';
import '../networking/response.dart';
import 'cart_screen.dart';

class productdetail {
  String? productimage;
  String? productprice;
  String? productname;
  bool? IsSelected;
  int? count;

  productdetail(
      {this.productimage,
      this.productprice,
      this.productname,
      this.count,
      this.IsSelected});
}

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  int _itemCount = 0;
  late ProductBloc productBloc;
  List<Datum> orderDataList = [];
  @override
  void initState() {
    super.initState();
    productBloc = ProductBloc();
    productBloc.Product();
    productBloc.ProductStream.listen((event) {
      switch (event.status) {
        case Status.LOADING:
          break;
        case Status.COMPLETED:
          setState(() {
            orderDataList = event.data!.data!;
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
                  "Best Selling Products",
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
                  itemCount: orderDataList.length,
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () async {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.white,
                            content: Row(
                              children: [
                                Image.network(
                                  orderDataList[index].image.toString(),
                                  width: 10.w,
                                  height: 10.w,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Container(
                                  height: 10.w,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        orderDataList[index]
                                            .title
                                            .toString(),
                                        style: TextStyle(
                                            color: Color(0xffac6e74),
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        orderDataList[index]
                                            .price
                                            .toString(),
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            duration: Duration(seconds: 1),
                            action: SnackBarAction(
                              textColor: Colors.black,
                              label: 'Dismiss',
                              onPressed: () {
                                ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar();
                              },
                            ),
                          ),
                        );
                        setState(() {
                          if (products.isNotEmpty) {
                            for (var item in products) {
                              if (item.productname ==
                                  orderDataList[index]
                                      .category
                                      .toString()) {
                                item.count = item.count! + 1;
                              } else {
                                products.add(orderDataList[index]);
                              }
                            }
                          } else {
                            products.add(orderDataList[index]);
                          }
                        });
                      },
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          GestureDetector(
                            child: Container(
                              width: 120,
                              height: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      image: NetworkImage(orderDataList[index]
                                          .image
                                          .toString()),
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
                                    orderDataList[index]
                                        .price
                                        .toString(),
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
                                    orderDataList[index]
                                        .title
                                        .toString(),
                                    style: const TextStyle(
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
          ),
        ],
      ),
    );
  }
}
