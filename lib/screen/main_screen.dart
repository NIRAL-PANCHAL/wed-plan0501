import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner_project/screen/planning_screen.dart';
import 'package:wedding_planner_project/screen/shop_screen.dart';
import 'package:wedding_planner_project/screen/vendors_page.dart';
import 'package:wedding_planner_project/screen/venue_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedindex = 0;
  static List _slideChange = [
    MainScreen(),
    VendorsScreen(),
    Text("hello"),
    ShopScreen(),
    PlanningScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _slideChange.elementAt(_selectedindex),
      bottomNavigationBar: Container(
        width: 100.w,
        height: 15.w,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(right: 3.5.w),
              height: 7.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _selectedindex = 0;
                      });
/*
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>MainScreen()));
*/
                    },
                    icon: Icon(
                      Icons.location_on_outlined,
                      color:
                          _selectedindex == 0 ? Color(0xffac6e74) : Colors.grey,
                      size: 25,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _selectedindex = 1;
                      });
                    },
                    icon: Icon(
                      Icons.store_mall_directory,
                      color:
                          _selectedindex == 1 ? Color(0xffac6e74) : Colors.grey,
                      size: 25,
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 3),
                      child: Image.asset(
                        "assets/bulb.png",
                        color: _selectedindex == 2
                            ? Color(0xffac6e74)
                            : Colors.grey,
                        width: 23,
                        height: 23,
                      )),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _selectedindex = 3;
                      });
                    },
                    icon: Icon(
                      Icons.shopping_cart_outlined,
                      color:
                          _selectedindex == 3 ? Color(0xffac6e74) : Colors.grey,
                      size: 25,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedindex = 4;
                      });
                    },
                    child: Container(
                        padding: EdgeInsets.only(top: 1.w),
                        width: 9.w,
                        height: 9.w,
                        child: Image.asset(
                          "assets/planning.png",
                          color: _selectedindex == 4
                              ? Color(0xffac6e74)
                              : Colors.grey,
                          width: 23,
                          height: 23,
                        )),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Venues",
                    style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFFBDBDBD),
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "Vendors",
                    style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFFBDBDBD),
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "Ideas",
                    style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFFBDBDBD),
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "Shop",
                    style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFFBDBDBD),
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "Planning",
                    style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFFBDBDBD),
                        fontWeight: FontWeight.w700),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
