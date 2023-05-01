import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../networking/Bloc/hotelBloc.dart';
import '../networking/models/response/hotel_list_reponse_model.dart';
import '../networking/response.dart';

class DropdownMenuPage extends StatefulWidget {
  @override
  _DropdownMenuPageState createState() => _DropdownMenuPageState();
}

class _DropdownMenuPageState extends State<DropdownMenuPage> {
  late HotelBloc hotelBloc;
  List<Datum> HotelDataList = [];
  late Datum selectedHotel; // define selectedHotel variable


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
      body: Center(
      ),
    );
  }
}
