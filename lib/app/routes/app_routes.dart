part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const HOME = _Paths.HOME;

  static String detail(dynamic id) => "${_Paths.DETAIL}/$id";
}

abstract class _Paths {
  _Paths._();

  static const HOME = '/home';
  static const DETAIL = '/detail';
  static const PARAMTETER_ID = '/:id';
}
