import '../../../models/pixabay_image.dart';

abstract class HomeRepository {
  Future<List<PixabayImage>> getImages(Map<String, dynamic> query);
}
