import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../models/pixabay_image.dart';
import '../../../routes/app_pages.dart';
import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  const DetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
          onTap: () {
            Get.offAllNamed(Routes.HOME);
          },
          child: Obx(() {
            PixabayImage? image = controller.image.value;
            if (null != image) {
              return Row(mainAxisSize: MainAxisSize.min, children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: CachedNetworkImage(
                    imageUrl: image.userImageURL,
                    width: 40.0,
                    height: 40.0,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 4.0,
                ),
                Text(
                  image.user,
                ),
              ]);
            }
            return const Text('Detail');
          }),
        ),
        actions: [
          Obx(() {
            PixabayImage? image = controller.image.value;
            if (null != image) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "${image.views} Views",
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    width: 4.0,
                  ),
                  const Icon(Icons.visibility_outlined),
                  const SizedBox(
                    width: 16.0,
                  ),
                  Text(
                    "${image.likes} Likes",
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    width: 4.0,
                  ),
                  const Icon(Icons.thumb_up_outlined),
                  const SizedBox(
                    width: 16.0,
                  ),
                ],
              );
            }
            return const SizedBox.shrink();
          }),
        ],
      ),
      body: Obx(() {
        PixabayImage? image = controller.image.value;
        if (null != image) {
          return Stack(
            children: [
              Opacity(
                opacity: 0.15,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                  child: Image.network(
                    image.previewURL,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              ),
              CachedNetworkImage(
                imageUrl: image.largeImageURL,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
                        child: CircularProgressIndicator(
                            value: downloadProgress.progress)),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                width: double.infinity,
                height: double.infinity,
              ),
            ],
          );
        }
        return const Padding(
            padding: EdgeInsets.all(4.0),
            child: Center(
              child: Text("loading..."),
            ));
      }),
    );
  }
}
