import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommonTextField extends StatefulWidget {
  String? textfield = "";
  Color? fillCollor;
  Function(String)? onchanged;
  TextInputType? inputType;
  List<TextInputFormatter>? digits;
  TextEditingController? controller;
  bool? obscureText;

  CommonTextField(
      {Key? key,
      this.textfield,
      this.onchanged,
      this.fillCollor,
      this.inputType,
      this.digits,
      this.controller,
      this.obscureText})
      : super(key: key);

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Please enter some text.";
        } else {
          return null;
        }
      },
      style: TextStyle(
          fontSize: 20, color: Color(0xFFBDBDBD), fontWeight: FontWeight.w700),
      autofocus: false,
      showCursor: false,
      obscureText: widget.obscureText ?? false,
      controller: widget.controller,
      onChanged: widget.onchanged,
      inputFormatters: widget.digits,
      keyboardType: widget.inputType,
      decoration: InputDecoration(
        fillColor: Colors.transparent,
        hintText: widget.textfield,
        hintStyle: TextStyle(
            fontSize: 20,
            color: Color(0xFFBDBDBD),
            fontWeight: FontWeight.w700),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black12),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: 1, color: Color(0xFFBDBDBD)),
        ),
      ),
    );
  }
}
