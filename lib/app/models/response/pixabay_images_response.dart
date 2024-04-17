import '../pixabay_image.dart';

class PixabayImagesResponse {
  List<PixabayImage> images;
  int total;
  int totalHits;

  PixabayImagesResponse({
    required this.images,
    required this.total,
    required this.totalHits,
  });

  factory PixabayImagesResponse.fromJson(Map<String, dynamic> json) {
    List<PixabayImage> images = <PixabayImage>[];
    if (json['hits'] != null) {
      json['hits'].forEach((v) {
        images.add(PixabayImage.fromJson(v));
      });
    }

    return PixabayImagesResponse(
      images: images,
      total: json['total'],
      totalHits: json['totalHits'],
    );
  }
}
