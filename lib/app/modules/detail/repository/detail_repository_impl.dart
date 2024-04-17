import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../models/pixabay_image.dart';
import '../../../models/response/pixabay_images_response.dart';
import 'detail_repository.dart';

class DetailRepositoryImpl implements DetailRepository {
  final dio = Dio();

  @override
  Future<PixabayImage?> getImage(Map<String, dynamic> query) async {
    try {
      final response =
          await dio.get("https://pixabay.com/api/", queryParameters: query);
      if (null != response.data) {
        return PixabayImagesResponse.fromJson(response.data).images.firstOrNull;
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return null;
  }
}
