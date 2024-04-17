import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/pixabay_image.dart';
import '../../../routes/app_pages.dart';

class PixabayImageItemView extends StatelessWidget {
  final PixabayImage image;

  const PixabayImageItemView(this.image, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.detail(image.id));
      },
      child: Card(
        margin: const EdgeInsets.all(4),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Stack(
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
              Image.network(
                image.previewURL,
                fit: BoxFit.contain,
                width: double.infinity,
                height: double.infinity,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black87,
                        Colors.black,
                      ],
                    ),
                  ),
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 8.0, bottom: 8.0, top: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${image.views} Views",
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "${image.likes} Likes",
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
