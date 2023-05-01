import 'dart:async';

import 'package:wedding_planner_project/networking/models/response/vendor_response_model.dart';

import '../repository/Repositories.dart';
import '../response.dart';


class VendorsBloc {
  late VendorRepository _vendorRepository;
  late StreamController
  VendorsBlocController;

  StreamSink get VendorsDataSink =>
      VendorsBlocController.sink;

  Stream get VendorsStream =>
      VendorsBlocController.stream;

  VendorsBloc() {
    VendorsBlocController =
        StreamController();
    _vendorRepository = VendorRepository();
  }

  Vendors() async {
    VendorsDataSink.add(Response.loading('Vendors'));
    try {
      VendorsResponseModel VendorsData =
      await _vendorRepository.VendorList();
      print(VendorsData);
      VendorsDataSink.add(Response.completed(VendorsData));
    } catch (e) {
      VendorsDataSink.add(Response.error(e.toString()));
      print(e);
    }
    return null;
  }

  dispose() {
    VendorsBlocController.close();
  }
}
