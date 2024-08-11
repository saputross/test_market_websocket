// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';

import '../modules/chart/bindings/chart_binding.dart';
import '../modules/chart/views/chart_view.dart';
import '../modules/list_market/bindings/list_market_binding.dart';
import '../modules/list_market/views/list_market_view.dart';
import '../modules/main/bindings/main_binding.dart';
import '../modules/main/views/main_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.MAIN;

  static final routes = [
    GetPage(
      name: _Paths.MAIN,
      page: () => const MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: _Paths.CHART,
      page: () => const ChartView(),
      binding: ChartBinding(),
    ),
    GetPage(
      name: _Paths.LIST_MARKET,
      page: () => const ListMarketView(),
      binding: ListMarketBinding(),
    ),
  ];
}
