// ignore_for_file: unnecessary_overrides, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:test_market_websocket/app/modules/chart/bindings/chart_binding.dart';
import 'package:test_market_websocket/app/modules/chart/controllers/chart_controller.dart';
import 'package:test_market_websocket/app/modules/chart/views/chart_view.dart';
import 'package:test_market_websocket/app/modules/list_market/bindings/list_market_binding.dart';
import 'package:test_market_websocket/app/modules/list_market/controllers/list_market_controller.dart';
import 'package:test_market_websocket/app/modules/list_market/views/list_market_view.dart';

class MainController extends GetxController {
  Rx<Widget> tabPage = Container(child: const ChartView()).obs;
  RxInt currentTab = 0.obs;
  final arg = Get.arguments;
  DateTime? currentBackPressTime;

  @override
  void onInit() {
    super.onInit();
    ChartBinding().dependencies();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<bool?> onWillPop() async {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null || now.difference(currentBackPressTime!) > const Duration(milliseconds: 2000)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
        msg: "Press again to exit",
        backgroundColor: Colors.grey.shade800.withOpacity(0.9),
      );
      return false;
    }
    if (currentTab.value == 0) {
      ChartController chartController = Get.find<ChartController>();
      chartController.close();
    } else {
      ListMarketController listMarketController = Get.find<ListMarketController>();
      listMarketController.close();
    }

    return true;
  }

  onChangeTab({required int tab, dynamic param}) {
    if (tab != currentTab.value) {
      currentTab.value = tab;
      switch (tab) {
        case 0:
          if (Get.isRegistered<ListMarketController>()) {
            Get.find<ListMarketController>().close();
          }
          bool isRegistered = Get.isRegistered<ChartController>();
          if (isRegistered) {
            Get.find<ChartController>().init();
          } else {
            ChartBinding().dependencies();
          }
          tabPage.value = Container(child: const ChartView());
          break;

        case 1:
          if (Get.isRegistered<ChartController>()) {
            Get.find<ChartController>().close();
          }
          bool isRegistered = Get.isRegistered<ListMarketController>();
          if (isRegistered) {
            Get.find<ListMarketController>().init();
          } else {
            ListMarketBinding().dependencies();
          }
          tabPage.value = Container(child: const ListMarketView());
          break;

        default:
      }
    }
  }
}
