import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CommonText extends StatefulWidget {
  String name= "";
  double? fontsize;
   CommonText({Key? key,required this.name, this.fontsize}) : super(key: key);

  @override
  State<CommonText> createState() => _CommonTextState();
}

class _CommonTextState extends State<CommonText> {


  @override
  Widget build(BuildContext context) {
    return
       Text(
        widget.name,
         style: TextStyle(
           color: Colors.black,
           fontSize: widget.fontsize ?? 16.sp,
         ),
    );
  }
}
