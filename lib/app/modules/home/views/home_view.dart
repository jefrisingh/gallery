import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../models/pixabay_image.dart';
import '../controllers/home_controller.dart';
import 'pixabay_image_item_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = (screenWidth / 250).floor();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery'),
        actions: [
          Container(
            constraints: const BoxConstraints(
              minWidth: 100,
              maxWidth: 300,
            ),
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controller.searchTextInputController,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10.0),
                hintText: 'search here',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                    onPressed: controller.search,
                    icon: const Icon(Icons.search)),
              ),
              style: const TextStyle(height: 1),
              onSubmitted: (value) {
                controller.search();
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: PagedGridView(
          pagingController: controller.pagingController,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
          ),
          builderDelegate: PagedChildBuilderDelegate<PixabayImage>(itemBuilder:
              (BuildContext context, PixabayImage item, int index) {
            return PixabayImageItemView(item);
          }),
        ),
      ),
    );
  }
}
