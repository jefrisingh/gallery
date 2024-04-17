import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../repository/home_repository_impl.dart';

class HomeBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<HomeRepositoryImpl>(
            () => HomeRepositoryImpl(),
      ),
      Bind.lazyPut<HomeController>(
        () => HomeController(),
      ),
    ];
  }
}
