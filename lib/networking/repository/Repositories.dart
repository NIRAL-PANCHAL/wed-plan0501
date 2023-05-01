import 'package:wedding_planner_project/networking/models/response/vendor_response_model.dart';

import '../ApiProvider.dart';
import '../models/response/category_response_model.dart';
import '../models/response/hotel_list_reponse_model.dart';
import '../models/response/productlist_model.dart';
import 'package:wedding_planner_project/utils/constant.dart' as Constants;
class ProductRepository {
  final ApiProvider _apiProvider = ApiProvider();
  Future<OrderListResponseModel> productList() async {
    final response = await _apiProvider.get(Constants.producturl);
    return OrderListResponseModel.fromJson(response);
  }
}

class HotelRepository {
  final ApiProvider _apiProvider = ApiProvider();
  Future<HotelsResponseModel> hotelList() async {
    final response = await _apiProvider.get(Constants.hotelurl);
    return HotelsResponseModel.fromJson(response);
  }
}

class VendorRepository {
  final ApiProvider _apiProvider = ApiProvider();
  Future<VendorsResponseModel> VendorList() async {
    final response = await _apiProvider.get(Constants.vendorurl);
    return VendorsResponseModel.fromJson(response);
  }
}
class CategoryRepository {
  final ApiProvider _apiProvider = ApiProvider();
  Future<CategoryResponseModel> CategoryList() async {
    final response = await _apiProvider.get(Constants.Categoryurl);
    return CategoryResponseModel.fromJson(response);
  }
}