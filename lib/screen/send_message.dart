import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner_project/widgets/common_TextField.dart';
import '../widgets/common_appbar.dart';

class SendMessage extends StatefulWidget {
  const SendMessage({Key? key}) : super(key: key);

  @override
  State<SendMessage> createState() => _SendMessageState();
}

class _SendMessageState extends State<SendMessage> {
  String dropdownValue = "Weddinng";
  TextEditingController dateController = TextEditingController();

  @override
  void initState() {
    dateController.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(
          appbarText: "",
          bgcolor: const Color(0xFFEEEEEE),
          leading: const BackButton(
            color: Colors.black,
          )),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 10),
              color: const Color(0xFFEEEEEE),
              width: 400,
              height: 130,
              child: const ListTile(
                title: Padding(
                  padding: EdgeInsets.only(bottom: 5.0),
                  child: Text(
                    "Send Message",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                  ),
                ),
                subtitle: Text(
                  "Let us know your Requirements",
                  style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFFBDBDBD),
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            Container(
              margin: const EdgeInsets.only(left: 25, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text("My Function Type is",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                  Container(
                    width: 80.w,
                    height: 5.h,
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.transparent, width: 3),
                        ),
                        child: Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: DropdownButton(
                              underline: Container(
                                height: 0.5,
                                color: Colors.grey, //<-- SEE HERE
                              ),
                              hint: const Text(
                                "Chooese function type",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xFFBDBDBD),
                                    fontWeight: FontWeight.w700),
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue = newValue!;
                                });
                              },
                              items: <String>[
                                'Wedding',
                                'Birthday-party',
                                'Ring-ceramony',
                                'Birthday-party',
                                'Ring-ceramony'
                              ] // dropdown options
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                return DropdownMenuItem<String>(
                                  value: "Wedding",
                                  child: Text(
                                    value,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        color: Color(0xFFBDBDBD),
                                        fontWeight: FontWeight.w700),
                                  ),
                                );
                              }).toList(),
                              icon: const Padding(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Icon(
                                    Icons.keyboard_arrow_down_sharp,
                                    color: Color(0xffac6e74),
                                  )),
                              iconEnabledColor: Colors.white,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 20),
                              dropdownColor: Colors.white,
                              isExpanded: true,
                            ))),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 30),
                    child: Text("Function Date is",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600)),
                  ),
                  Container(
                      margin: EdgeInsets.only(right: 15,),
                      child: Center(
                          child: TextField(
                              controller: dateController,
                              decoration: const InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black12),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: Color(0xFFBDBDBD)),
                                ),
                                suffix: Icon(
                                  Icons.date_range_outlined,
                                  color: Color(0xffac6e74),
                                  size: 20,
                                ),
                                hintText: "Enter Date",
                                hintStyle: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xFFBDBDBD),
                                    fontWeight: FontWeight.w700),
                              ),
                              readOnly: true,
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1919),
                                  lastDate: DateTime(2040),
                                  builder: (context, child) {
                                    return Theme(
                                      data: Theme.of(context).copyWith(
                                        colorScheme: ColorScheme.light(
                                            primary: Color(0xffac6e74),
                                            // <-- SEE HERE
                                            onPrimary: Colors.white,
                                            // <-- SEE HERE
                                            onSurface: Color(0xffac6e74),
                                            background: Color(
                                                0xffac6e74) // <-- SEE HERE
                                            ),
                                        textButtonTheme: TextButtonThemeData(
                                          style: TextButton.styleFrom(
                                            primary: Color(
                                                0xffac6e74), // button text color
                                          ),
                                        ),
                                      ),
                                      child: child!,
                                    );
                                  },
                                );
                              }))),
                  SizedBox(height: 35,),
                  Text("My Function Type is",
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                  Container(
                    margin: EdgeInsets.only(right: 15),
                    child: CommonTextField(
                      textfield: "Enter Number of Guest",
                        inputType: TextInputType.number
                    ),
                  ),
                ],
              ),
            ),

             SizedBox(
              height: 30.h,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.only(top: 25),
                height: 60,
                width: 350,
                decoration: BoxDecoration(
                    color: const Color(0xffac6e74), //ce969f
                    borderRadius: BorderRadius.circular(30)),
                padding: const EdgeInsets.only(top: 19),
                child: const Text(
                  'Start a message',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
