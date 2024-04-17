import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../models/pixabay_image.dart';
import '../repository/home_repository.dart';
import '../repository/home_repository_impl.dart';

class HomeController extends GetxController {
  HomeRepository homeRepository = Get.find<HomeRepositoryImpl>();
  TextEditingController searchTextInputController = TextEditingController();
  int perPage = 50;

  final PagingController<int, PixabayImage> pagingController =
      PagingController(firstPageKey: 1);

  @override
  void onInit() {
    pagingController.addPageRequestListener((pageKey) {
      if (pageKey == 1) {
        Future.delayed(const Duration(seconds: 1), () {
          fetchPage(pageKey);
        });
      } else {
        fetchPage(pageKey);
      }
    });
    super.onInit();
  }

  void fetchPage(int pageKey) {
    Map<String, dynamic> queryParameters = {
      "key": "43422905-c9db94d707ffd10eae4455047",
      "q": searchTextInputController.text.toString(),
      "image_typ": "photo",
      //"orientation": "horizontal",
      "page": pageKey,
      "per_page": perPage,
    };
    homeRepository.getImages(queryParameters).then((value) {
      final isLastPage = value.length < perPage;
      if (isLastPage) {
        pagingController.appendLastPage(value);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(value, nextPageKey);
      }
    });
  }

  //reset page and do refresh, fetchPage will include the search
  void search() {
    pagingController.refresh();
  }
}
