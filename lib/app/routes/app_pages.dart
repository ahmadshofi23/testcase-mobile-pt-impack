import 'package:get/get.dart';

import '../modules/activity_info/bindings/activity_info_binding.dart';
import '../modules/activity_info/views/activity_info_view.dart';
import '../modules/edit_activity/bindings/edit_activity_binding.dart';
import '../modules/edit_activity/views/edit_activity_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/new_activity/bindings/new_activity_binding.dart';
import '../modules/new_activity/views/new_activity_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ACTIVITY_INFO,
      page: () => const ActivityInfoView(),
      binding: ActivityInfoBinding(),
    ),
    GetPage(
      name: _Paths.NEW_ACTIVITY,
      page: () => const NewActivityView(),
      binding: NewActivityBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_ACTIVITY,
      page: () => const EditActivityView(),
      binding: EditActivityBinding(),
    ),
  ];
}
