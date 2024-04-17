import '../../../models/pixabay_image.dart';

abstract class DetailRepository {
  Future<PixabayImage?> getImage(Map<String, dynamic> query);
}
