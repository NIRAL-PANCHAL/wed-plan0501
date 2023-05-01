import 'package:flutter/material.dart';
class CommonAppbar extends StatefulWidget with PreferredSizeWidget {
  String? appbarText;
  Function? onpress;
  Function? onpress2;
  String? button1Image;
  String? button2Image;
  Widget? leading;
  Color? bgcolor;
  bool? automaticallyImplyLeading;
  CommonAppbar(
      {Key? key,
      required this.appbarText,
      this.onpress,
      this.onpress2,
      this.button1Image,
        this.leading,
        this.bgcolor,
      this.button2Image,  this.automaticallyImplyLeading,})
      : super(key: key);

  @override
  State<CommonAppbar> createState() => _CommonAppbarState();

  @override
  Size get preferredSize => Size.fromHeight(60);
}

class _CommonAppbarState extends State<CommonAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: widget.automaticallyImplyLeading ?? false,
      title: Text(
        widget.appbarText ?? "",
        style: TextStyle(fontSize: 28),
      ),
      elevation: 0,
      backgroundColor: widget.bgcolor,
      leading: widget.leading ?? null,
      actions: [
        widget.button1Image == null
            ? Container()
            : ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  padding: const EdgeInsets.all(8),
                  primary: Colors.transparent,
                ),
                onPressed: () {
                  widget.onpress!();
                },
                child: widget.button1Image != null
                    ? Container(width : 40, height: 60,color: Colors.transparent,child: Image.asset(widget.button1Image ?? ""))
                    : null),
        widget.button2Image == null
            ? Container()
            : ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  padding: const EdgeInsets.all(8),
                ),
                onPressed: () {
                  widget.onpress2!();
                },
                child: widget.button2Image != null
                    ? Container(width : 40, height: 20,color: Colors.transparent,child: Image.asset(widget.button2Image ?? ""))
                    : null)
      ],
    );
  }
}
