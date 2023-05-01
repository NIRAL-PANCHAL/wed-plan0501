import 'package:flutter/material.dart';
class CommonImage extends StatefulWidget {
  String commonimages;
  BorderRadiusGeometry? borderRadius;
  double? commonwidth;
  double? commonheight;
  Widget? child;
   CommonImage({Key? key,required this.commonimages,this.borderRadius,this.commonwidth,this.child, this.commonheight}) : super(key: key);

  @override
  State<CommonImage> createState() => _CommonImageState();
}

class _CommonImageState extends State<CommonImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.commonwidth,
      height: widget.commonheight,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(widget.commonimages),
          fit: BoxFit.cover
        )
      ),
      child : widget.child,
    );
  }
}
