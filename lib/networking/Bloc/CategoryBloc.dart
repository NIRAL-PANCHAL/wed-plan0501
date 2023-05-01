import 'dart:async';

import 'package:wedding_planner_project/networking/models/response/category_response_model.dart';

import '../repository/Repositories.dart';
import '../response.dart';


class CategoryBloc {
  late CategoryRepository _CategoryRepository;
  late StreamController
  CategoryBlocController;

  StreamSink get CategoryDataSink =>
      CategoryBlocController.sink;

  Stream get CategoryStream =>
      CategoryBlocController.stream;

  CategoryBloc() {
    CategoryBlocController =
        StreamController();
    _CategoryRepository = CategoryRepository();
  }

  Category() async {
    CategoryDataSink.add(Response.loading('Categorys'));
    try {
      CategoryResponseModel CategoryData =
      await _CategoryRepository.CategoryList();
      print(CategoryData);
      CategoryDataSink.add(Response.completed(CategoryData));
    } catch (e) {
      CategoryDataSink.add(Response.error(e.toString()));
      print(e);
    }
    return null;
  }

  dispose() {
    CategoryBlocController.close();
  }
}
