import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class CommonButton extends StatefulWidget {
  String btntext;
  Function onpress;
  double? btnheight;
  double? btnwidth;
  BorderRadius? btnradius;
  double? fontsize;
  Color? buttoncolor;

  CommonButton(
      {Key? key,
      required this.btntext,
      this.buttoncolor,
       this.btnheight, this.btnradius,
       this.btnwidth, required this.onpress,
         this.fontsize
      })
      : super(key: key);

  @override
  State<CommonButton> createState() => _CommonButtonState();
}
class _CommonButtonState extends State<CommonButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 130),
      height: widget.btnheight ?? 50,
      width: widget.btnwidth ?? 380,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary:  widget.buttoncolor ?? Color(0xff8E9F5A),
            shape:
                RoundedRectangleBorder(borderRadius: widget.btnradius ?? BorderRadius.circular(20)),
          ),
          child:  Text(
            widget.btntext,
            style: TextStyle(
                fontSize: widget.fontsize ?? 18.sp, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            widget.onpress();
          }),
    );
  }
}
