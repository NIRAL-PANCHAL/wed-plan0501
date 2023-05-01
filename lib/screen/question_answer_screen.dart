import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../widgets/common_appbar.dart';

class FaQsScreen extends StatefulWidget {
  const FaQsScreen({Key? key}) : super(key: key);

  @override
  State<FaQsScreen> createState() => _FaQsScreenState();
}

class _FaQsScreenState extends State<FaQsScreen> {
  bool _isExpanded = false;
  Color _tileColor = Colors.black;
  List questionlist = [
    "How to Shortlist a vendor?",
    "How to chat?",
    "How to change profile picture?",
    "How to call Vendor?",
    "How to shop?",
    "Can I login through Social account?",
    "How to logout my account?",
    "How to Finalize a vendor?"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      appBar: CommonAppbar(
          appbarText: "",
          bgcolor: Color(0xFFEEEEEE),
          leading: const BackButton(
            color: Colors.black,
          )),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(top: 10),
              color: Color(0xFFEEEEEE),
              width: 100.w,
              height: 130,
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: Text(
                    "FAQs",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                  ),
                ),
                subtitle: Text(
                  "Get your answers",
                  style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFFBDBDBD),
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20, left: 5),
              width: 100.w,
              height: 100.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: ListView.builder(
                itemCount: questionlist.length,
                itemBuilder: ((context, index) {
                  return Theme(
                    data:
                        ThemeData().copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      title: Text(
                        questionlist[index].toString(),
                        style: TextStyle(
                            color: Color(0xffac6e74),
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                      trailing: Icon(
                        Icons.arrow_drop_down,
                        color: Color(0xffac6e74),
                      ),
                      onExpansionChanged: (bool expanded) {
                        setState(() {
                          _isExpanded = expanded;
                          _tileColor =
                              _isExpanded ? Colors.black : Colors.black;
                        });
                      },
                      children: <Widget>[
                        ListTile(
                          title: Row(
                            children: [
                              Text(
                                "This application established by square apple\n(Niral.Panchal).",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1.2,
                                  height: 1.5,
                                ),
                                textAlign: TextAlign.justify,
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
