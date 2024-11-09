import 'package:get/get.dart';
import 'package:task1/app/modules/home/views/home_view.dart';
import 'package:task1/app/modules/home/views/sign_up.dart';

import '../modules/home/bindings/home_binding.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.signUp;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.signUp,
      page: () =>  SignUpScreen(),
      binding: HomeBinding(),
    ),

  ];
}