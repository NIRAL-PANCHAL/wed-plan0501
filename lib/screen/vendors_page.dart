import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner_project/networking/Bloc/VendorBloc.dart';
import 'package:wedding_planner_project/screen/venueDetails_screen.dart';

import '../networking/models/response/vendor_response_model.dart';
import '../networking/response.dart';

class VendorsScreen extends StatefulWidget {
  String? venueimage;
  String? venuename;
  String? venuelocation;
   VendorsScreen({Key? key,  this.venueimage,  this.venuename,  this.venuelocation, }) : super(key: key);

  @override
  State<VendorsScreen> createState() => _VendorsScreenState();
}

class _VendorsScreenState extends State<VendorsScreen> {
  bool isExpanded = false;
  Color _tileColor = Colors.black;

  late VendorsBloc vendorsBloc;
  List<VendorDatas> VendorDataList = [];
  @override
  void initState() {
    super.initState();
    vendorsBloc = VendorsBloc();
    vendorsBloc.Vendors();
    vendorsBloc.VendorsStream.listen((event) {
      switch (event.status) {
        case Status.LOADING:
          onLoading(context);
          break;
        case Status.COMPLETED:
          setState(() {
            VendorDataList = event.data.data;
          });
          stopLoader(context);
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
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: RichText(
            text: TextSpan(
                text: 'Vendors in',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 18),
                children: [
              TextSpan(
                  text: '  Ahmedabad',
                  style: TextStyle(color: Color(0xffac6e74))),
            ])),
        actions: [
          Container(
            child: Row(
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
                SizedBox(
                  width: 20,
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
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: ScrollConfiguration(
              behavior: const ScrollBehavior(),
              child: GlowingOverscrollIndicator(
                axisDirection: AxisDirection.left,
                color: Colors.white,
                child: ListView.builder(
                  itemCount: VendorDataList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(top: 20,left: 10,right: 20),
                      child: Stack(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 250),
                            width: 400,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image.network(VendorDataList[index].vendorImg.toString(),
                                height: 86,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            padding: EdgeInsets.only(top: 14),
                            width: 400,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                colors: [Color(0xFFF5F5F5), Colors.white10],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                stops: [0.65, 0.9],
                              ),
                            ),
                            child: GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>VanueDetails(
                                  appbartitle : VendorDataList[index].vendorname.toString(),
                                  venuepic : VendorDataList[index].vendorsDetail,
                                )));

                              },
                              child: Container(
                                height: 90,
                                child: ListTile(
                                  title: Text(VendorDataList[index].vendorname.toString(),
                                      style: TextStyle(
                                          fontSize: 26,
                                          fontWeight: FontWeight.w600,
                                          color: _tileColor)),
                                  subtitle: Container(
                                    width: 30.w,
                                    child: Text(
                                      VendorDataList[index].vendorDispriction.toString(),
                                      maxLines: 2,
                                      style: TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: 18,
                                          color: Color(0xFFBDBDBD),
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),

                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
///loader
bool isLoading = true;

void onLoading(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierColor: Colors.white.withOpacity(0.5),
    barrierDismissible: false,
    barrierLabel: "Dialog",
    transitionDuration: const Duration(milliseconds: 1500),
    pageBuilder: (index, _, ___) {
      return const Center(
          child: CircularProgressIndicator(
            color: Color(0xffac6e74),
          ));
    },
  ).then((value) {
    isLoading = false;
  });
}

void stopLoader(BuildContext context) {
  Navigator.pop(context);
}