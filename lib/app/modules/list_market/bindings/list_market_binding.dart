import 'package:get/get.dart';

import '../controllers/list_market_controller.dart';

class ListMarketBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListMarketController>(
      () => ListMarketController(),
    );
  }
}
