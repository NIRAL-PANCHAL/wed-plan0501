import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:wedding_planner_project/screen/venue_screen.dart';
import 'package:wedding_planner_project/widgets/common_text.dart';
import '../networking/Bloc/hotelBloc.dart';
import '../networking/models/response/hotel_list_reponse_model.dart';
import '../networking/Bloc/hotelBloc.dart';
import '../networking/response.dart';
import '../utils/constant.dart';
import '../widgets/common_TextField.dart';
import '../widgets/common_appbar.dart';
import 'main_screen.dart';

class PlanningScreen extends StatefulWidget {
  const PlanningScreen({Key? key}) : super(key: key);

  @override
  State<PlanningScreen> createState() => _PlanningScreenState();
}

class _PlanningScreenState extends State<PlanningScreen> {
  String dropdownValue = "Weddinng";
  bool isChecked = true;
  bool isChecked1 = false;
  String? gender;
  double start = 500.0;
  double end = 7500.0;
  TextEditingController dateinput = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController dateController2 = TextEditingController();
  TextEditingController dateController3 = TextEditingController();

  late HotelBloc hotelBloc;
  final _formKey = GlobalKey<FormState>();
  List<Datum> HotelDataList = [];
  Datum? selectedHotel; // define selectedHotel variable

  @override
  void initState() {
    super.initState();
    hotelBloc = HotelBloc();
    hotelBloc.Hotel();
    hotelBloc.HotelStream.listen((event) {
      switch (event.status) {
        case Status.LOADING:
          break;
        case Status.COMPLETED:
          setState(() {
            HotelDataList = event.data.data;
          });
          break;
        case Status.ERROR:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 12.w),
                  color: const Color(0xFFEEEEEE),
                  width: 400,
                  height: 130,
                  child: const ListTile(
                    title: Padding(
                      padding: EdgeInsets.only(bottom: 5.0),
                      child: Text(
                        "Plan your functions",
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffac6e74)),
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
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600)),
                      Container(
                        width: 80.w,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.transparent, width: 3),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: DropdownButton<String>(
                              underline: Container(
                                height: 0.5,
                                color: Colors.grey,
                              ),
                              hint: dropdownValue == null
                                  ? const Text(
                                      "Choose function type",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Color(0xFFBDBDBD),
                                        fontWeight: FontWeight.w700,
                                      ),
                                    )
                                  : Text(
                                      dropdownValue!,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Color(0xFFBDBDBD),
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue = newValue!;
                                });
                              },
                              items: <String>[
                                'Destination Wedding',
                                'Authentic-indian Wedding',
                                'Ring-ceramony',
                                'Recieption',
                                'Trending-style Wedding',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Color(0xFFBDBDBD),
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                );
                              }).toList(),
                              icon: const Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Icon(
                                  Icons.keyboard_arrow_down_sharp,
                                  color: Color(0xffac6e74),
                                ),
                              ),
                              iconEnabledColor: Colors.white,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 20),
                              dropdownColor: Colors.white,
                              isExpanded: true,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 30),
                        child: Text("Function Date is",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600)),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          right: 15,
                        ),
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
                                        onPrimary: Colors.white,
                                        onSurface: Color(0xffac6e74),
                                        background: Color(0xffac6e74),
                                      ),
                                      textButtonTheme: TextButtonThemeData(
                                        style: TextButton.styleFrom(
                                          primary: Color(0xffac6e74),
                                        ),
                                      ),
                                    ),
                                    child: child!,
                                  );
                                },
                              );
                              if (pickedDate != null) {
                                String formattedDate =
                                    DateFormat('dd-MM-yyyy').format(pickedDate);
                                dateController.text =
                                    formattedDate; // <-- update the text in the TextField
                              }
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Text("Enter Number of Guest",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600)),
                      Container(
                        margin: EdgeInsets.only(right: 15),
                        child: CommonTextField(
                          digits: [
                            LengthLimitingTextInputFormatter(4),
                          ],
                          textfield: "Number of Guest is",
                          inputType: TextInputType.number,
                        ),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Text("Select start date",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600)),
                      Container(
                        margin: EdgeInsets.only(
                          right: 15,
                        ),
                        child: Center(
                          child: TextField(
                            controller: dateController2,
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
                                        onPrimary: Colors.white,
                                        onSurface: Color(0xffac6e74),
                                        background: Color(0xffac6e74),
                                      ),
                                      textButtonTheme: TextButtonThemeData(
                                        style: TextButton.styleFrom(
                                          primary: Color(0xffac6e74),
                                        ),
                                      ),
                                    ),
                                    child: child!,
                                  );
                                },
                              );
                              if (pickedDate != null) {
                                String formattedDate =
                                    DateFormat('dd-MM-yyyy').format(pickedDate);
                                dateController2.text = formattedDate;

                                // Check if the end date is before the start date
                                if (dateController3.text.isNotEmpty) {
                                  DateTime startDate = DateFormat('dd-MM-yyyy')
                                      .parse(dateController2.text);
                                  DateTime endDate = DateFormat('dd-MM-yyyy')
                                      .parse(dateController3.text);
                                  if (endDate.isBefore(startDate)) {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          content: Container(
                                            width: 60.w,
                                            height: 40.w,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text("Invalid Date Choose!",
                                                    style: TextStyle(
                                                        fontSize: 18.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black)),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        width: 25.w,
                                                        height: 9.w,
                                                        decoration: BoxDecoration(
                                                            color: Color(
                                                                0xffac6e74),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        2.w)),
                                                        child: Text("Delete",
                                                            style: TextStyle(
                                                              fontSize: 16.sp,
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            )),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                    dateController3.text = '';
                                  }
                                }
                              }
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Text("Select End date",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600)),
                      Container(
                        margin: EdgeInsets.only(
                          right: 15,
                        ),
                        child: Center(
                          child: TextField(
                            controller: dateController3,
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
                                        onPrimary: Colors.white,
                                        onSurface: Color(0xffac6e74),
                                        background: Color(0xffac6e74),
                                      ),
                                      textButtonTheme: TextButtonThemeData(
                                        style: TextButton.styleFrom(
                                          primary: Color(0xffac6e74),
                                        ),
                                      ),
                                    ),
                                    child: child!,
                                  );
                                },
                              );
                              if (pickedDate != null) {
                                String formattedDate =
                                    DateFormat('dd-MM-yyyy').format(pickedDate);
                                dateController3.text = formattedDate;
                                if (dateController2.text.isNotEmpty) {
                                  DateTime startDate = DateFormat('dd-MM-yyyy')
                                      .parse(dateController2.text);
                                  DateTime endDate = DateFormat('dd-MM-yyyy')
                                      .parse(dateController3.text);
                                  if (startDate.isAfter(endDate)) {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          content: Container(
                                            width: 60.w,
                                            height: 40.w,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text("Invalid Date Choose!",
                                                    style: TextStyle(
                                                        fontSize: 18.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black)),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        width: 25.w,
                                                        height: 9.w,
                                                        decoration: BoxDecoration(
                                                            color: Color(
                                                                0xffac6e74),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        2.w)),
                                                        child: Text("Delete",
                                                            style: TextStyle(
                                                              fontSize: 16.sp,
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            )),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                    dateController3.text = '';
                                  }
                                } // <-- update the text in the TextField
                              }
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Text("Select Venue",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600)),
                      DropdownButton<Datum>(
                        hint: Text(
                          'Select a hotel',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFFBDBDBD),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        value: selectedHotel,
                        onChanged: (Datum? newValue) {
                          print(newValue);
                          setState(() {
                            selectedHotel = newValue!;
                          });
                        },
                        items: HotelDataList.map((Datum hotelData) {
                          return DropdownMenuItem<Datum>(
                            value: hotelData,
                            child: Text(
                              hotelData.hotelname.toString(),
                              style: TextStyle(
                                fontSize: 20,
                                color: Color(0xffac6e74),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          );
                        }).toList(),
                        icon: const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Icon(
                            Icons.keyboard_arrow_down_sharp,
                            color: Color(0xffac6e74),
                          ),
                        ),
                        iconEnabledColor: Colors.white,
                        style: const TextStyle(
                            color: Color(0xffac6e74), fontSize: 20),
                        dropdownColor: Colors.white,
                        isExpanded: true,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Select Type of food",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600)),
                      Row(
                        children: [
                          Text("Vegetarian",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFFBDBDBD))),
                          Checkbox(
                            checkColor: Colors.white,
                            value: isChecked,
                            activeColor: Colors.green,
                            onChanged: (bool? value) {
                              setState(() {
                                if (value == true) {
                                  isChecked = !isChecked;
                                  isChecked1 = false;
                                }
                              });
                            },
                          ),
                          Text("Non-Vegetarian",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFFBDBDBD))),
                          Checkbox(
                            checkColor: Colors.white,
                            value: isChecked1,
                            activeColor: Colors.red,
                            onChanged: (bool? value) {
                              setState(() {
                                if (value == true) {
                                  isChecked1 = !isChecked1;
                                  isChecked = false;
                                }
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text("Prcing",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600)),
                          const Spacer(),
                          Text(
                            start.toStringAsFixed(0) +
                                "₹" +
                                " - " +
                                end.toStringAsFixed(0) +
                                "₹",
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFFBDBDBD),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 3.w,
                      ),
                      SfRangeSliderTheme(
                        data: SfRangeSliderThemeData(
                            thumbRadius: 3.3.w,
                            overlayColor: Colors.white,
                            overlayRadius: 2.w),
                        child: SfRangeSlider(
                          thumbShape: const SfThumbShape(),
                          endThumbIcon: Container(
                            child: Image.asset(
                              "assets/food_dish.png",
                              color: Colors.white,
                              fit: BoxFit.cover,
                            ),
                            padding: EdgeInsets.all(0.8.w),
                          ),
                          startThumbIcon: Container(
                            padding: EdgeInsets.all(0.8.w),
                            child: Image.asset(
                              "assets/food_dish.png",
                              color: Colors.white,
                              fit: BoxFit.cover,
                            ),
                          ),
                          min: 500,
                          max: 7500,
                          values: SfRangeValues(start, end),
                          onChanged: (value) {
                            setState(() {
                              start = value.start;
                              end = value.end;
                            });
                          },
                          activeColor: Color(0xffac6e74),
                          inactiveColor: Colors.grey,
                        ),
                      ),
                      Row(
                        children: [
                          Spacer(),
                          Text(
                            ".per Dish Price",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Color(0xffac6e74)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (!_formKey.currentState!.validate()) {
                          } else {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.w),
                                  ),
                                  content: Container(
                                    width: 60.w,
                                    height: 40.w,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                            "Our representative will contact you shortly😊",
                                            style: TextStyle(
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xffac6e74))),
                                        Container(
                                          alignment: Alignment.center,
                                          width: 25.w,
                                          height: 9.w,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Color(0xffac6e74)),
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(2.w)),
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          MainPage()));
                                            },
                                            child: Text("Thank you",
                                                style: TextStyle(
                                                  fontSize: 16.sp,
                                                  color: Color(0xffac6e74),
                                                  fontWeight: FontWeight.w600,
                                                )),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 43.w,
                          height: 12.w,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color(0xffac6e74), width: 0.3.w),
                              color: Color(0xffac6e74),
                              borderRadius: BorderRadius.circular(1.w)),
                          child: Text(
                            "Apply",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
