import 'package:get/get.dart';

import '../controllers/detail_controller.dart';
import '../repository/detail_repository_impl.dart';

class DetailBinding extends Binding {
  @override
  List<Bind> dependencies() {

    return [
      Bind.lazyPut<DetailRepositoryImpl>(
        () => DetailRepositoryImpl(),
      ),
      Bind.lazyPut<DetailController>(
        () => DetailController(),
      ),
    ];
  }
}
