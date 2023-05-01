import 'dart:async';

import 'package:wedding_planner_project/networking/models/response/hotel_list_reponse_model.dart';
import '../repository/Repositories.dart';
import '../response.dart';


class HotelBloc {
  late HotelRepository _hotelRepository;
  late StreamController
  HotelBlocController;

  StreamSink get HotelDataSink =>
      HotelBlocController.sink;

  Stream get HotelStream =>
      HotelBlocController.stream;

  HotelBloc() {
    HotelBlocController =
        StreamController();
    _hotelRepository = HotelRepository();
  }

  Hotel() async {
    HotelDataSink.add(Response.loading('Hotels'));
    try {
      HotelsResponseModel HotelData =
      await _hotelRepository.hotelList();
      print(HotelData);
      HotelDataSink.add(Response.completed(HotelData));
    } catch (e) {
      HotelDataSink.add(Response.error(e.toString()));
      print(e);
    }
    return null;
  }

  dispose() {
    HotelBlocController.close();
  }
}
