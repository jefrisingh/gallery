import 'package:get/get.dart';

import '../../../models/pixabay_image.dart';
import '../repository/detail_repository.dart';
import '../repository/detail_repository_impl.dart';

class DetailController extends GetxController {
  DetailRepository detailRepository = Get.find<DetailRepositoryImpl>();
  Rxn<PixabayImage> image = Rxn<PixabayImage>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    getDetails();
  }

  void getDetails() {
    String? imageId = Get.parameters['id'];
    Map<String, dynamic> queryParameters = {
      "key": "43422905-c9db94d707ffd10eae4455047",
      "id": imageId,
    };

    print(queryParameters);
    detailRepository.getImage(queryParameters).then((value) {
      image.value = value;
    });
  }
}
