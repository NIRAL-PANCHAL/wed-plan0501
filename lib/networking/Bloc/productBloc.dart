import 'dart:async';

import '../models/response/productlist_model.dart';
import '../repository/Repositories.dart';
import '../response.dart';


class ProductBloc {
  late ProductRepository _productRepository;
  late StreamController
  ProductBlocController;

  StreamSink get ProductDataSink =>
      ProductBlocController.sink;

  Stream get ProductStream =>
      ProductBlocController.stream;

  ProductBloc() {
    ProductBlocController =
        StreamController();
    _productRepository = ProductRepository();
  }

  Product() async {
    ProductDataSink.add(Response.loading('products'));
    try {
      OrderListResponseModel ProductData =
      await _productRepository.productList();
      print(ProductData);
      ProductDataSink.add(Response.completed(ProductData));
    } catch (e) {
      ProductDataSink.add(Response.error(e.toString()));
      print(e);
    }
    return null;
  }

  dispose() {
    ProductBlocController.close();
  }
}
