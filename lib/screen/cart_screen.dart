import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner_project/screen/productList_screen.dart';

List products = [];

class CartScreen extends StatefulWidget {
  CartScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void _incrementCount(int index) {
    setState(() {
      products[index].count = products[index].count! + 1;
    });
  }

  void _decrement(int index) {
    setState(() {
      if (products[index].count! == 1) {
        products.removeAt(index);
      } else {
        products[index].count = products[index].count! - 1;
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
            color: const Color(0xffac6e74),
            child: Column(
              children: [
                SizedBox(
                  height: 6.h,
                ),
                const Center(
                    child: Text(
                  "Your Cart",
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 50,
                      color: Colors.white),
                ))
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15.h),
            width: 100.w,
            height: 87.h,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
            child: Container(
              margin: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: products.length,
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 20.w,
                                    height: 9.h,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          image: NetworkImage(products[index]
                                              .productimage
                                              .toString()),
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      SizedBox(
                                        width: 40.w,
                                        child: Text(
                                          products[index]
                                              .productname
                                              .toString(),
                                          overflow: TextOverflow.ellipsis,
                                          softWrap: false,
                                          style: const TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      Text(
                                        products[index].productprice.toString(),
                                        style: const TextStyle(
                                            fontSize: 18,
                                            color: Color(0xffac6e74),
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                  const Spacer(),
                                  Container(
                                    margin: const EdgeInsets.only(top: 15),
                                    width: 27.w,
                                    height: 4.h,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: const Color(0xffac6e74)),
                                    child: Row(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(top: 8),
                                          child: IconButton(
                                              onPressed: () {
                                                _decrement(index);
                                              },
                                              icon: const Icon(
                                                Icons.maximize,
                                                color: Colors.white,
                                                size: 15,
                                              )),
                                        ),
                                        Text(
                                          products[index].count.toString(),
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.white),
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              _incrementCount(index);
                                            },
                                            icon: const Icon(
                                              Icons.add,
                                              color: Colors.white,
                                              size: 15,
                                            )),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 5.w,
                              ),
                            ],
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
